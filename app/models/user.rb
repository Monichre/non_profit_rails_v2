class User < ApplicationRecord
  has_secure_password

  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation

  validates_uniqueness_of :email
end
