class User < ApplicationRecord
    include ActionController::Flash
    validates :name, presence: true
    validates :last_name , presence: true

    before_validation :update_name

    after_validation :full_name

    before_save :check_date

    after_create :notify

    after_commit :print_message

    after_save :notify

    after_destroy :user_deleted

    after_initialize do |user|
        puts "You have initialized a User"
    end

    after_touch do
        puts 'User object was touched'
    end

    def update_name
        self.name = name.downcase.titleize
        self.last_name = last_name.downcase.titleize
    end

    def full_name
        self.name = self.name + " "
        self.name = self.name + self.last_name
    end

    def check_date
        if self.dob >= Date.today
            self.message = "invalid date"
        end
    end

    def notify
        puts "User Created Succesfully"
    end

    def print_message
        puts "The record saved to database!"
    end

    def user_deleted
        puts "User Deleted successfully!"
    end
end
