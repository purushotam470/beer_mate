class User < ApplicationRecord
  has_secure_password
  enum gender: ["Male", "Female", "Others"]
  validates :email, presence: true, format: { with:  /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "invalid email format", on: :create}
  validates :email, uniqueness: {:case_sensitive => false, message: "the email is already registered with us"}
  validates :mobile_number, uniqueness: true, length: {is: 10, message: "mobile number should be of 10 digits"}, allow_blank: true
  validates :user_name, uniqueness: {case_sensitive: false, message: "user name already taken"}, on: [:update]
  before_save {self.email = email.downcase}
  before_save {self.user_name = email.split("@").first}
end
