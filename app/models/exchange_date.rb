class ExchangeDate < ApplicationRecord
  has_many :prices
  validates :date, presence: true, uniqueness: true
end
