class User < ApplicationRecord
  has_secure_password

  #attr_accessible :first_name, :last_name, :email, :password, :password_confirmation

  validates_uniqueness_of :email
  validates :first_name, presence: true, allow_nil: false, allow_blank: false
  validates :last_name, presence: true, allow_nil: false, allow_blank: false
  validates :email, presence: true, allow_nil: false, allow_blank: false
  validates :password, presence: true, allow_nil: false, allow_blank: false
  has_and_belongs_to_many :non_profits
end
