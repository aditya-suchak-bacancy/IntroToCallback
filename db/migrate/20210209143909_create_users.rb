class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.integer :contact
      t.date :dob
      t.string :email

      t.timestamps
    end
  end
end
