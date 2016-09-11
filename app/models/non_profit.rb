class NonProfit < ApplicationRecord
  has_secure_password

  validates :name, presence: true, allow_nil: false, allow_blank: false
  validates :email, presence: true, allow_nil: false, allow_blank: false
  validates :password, presence: true, allow_nil: false, allow_blank: false
  has_and_belongs_to_many :users
  has_and_belongs_to_many :categories
end
