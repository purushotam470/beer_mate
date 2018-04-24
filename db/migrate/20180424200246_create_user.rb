class CreateUser < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name
      t.string :email, null: false
      t.string :user_name, null: false
      t.integer :mobile_number
      t.date :dob
      t.boolean :email_confirmation, default: false
      t.integer :gender, default: 0
      t.integer :failed_attempts, default: 0
      t.string :email_confirmation_token
      t.string :password_digest
      t.boolean :emailable, default: true
      t.date :password_expire_date
    end
  end
end
