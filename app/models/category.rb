class Category < ApplicationRecord
  validates :name, presence: true, allow_nil: false, allow_blank: false
  has_and_belongs_to_many :non_profits
end
