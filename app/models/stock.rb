class Stock < ApplicationRecord
  has_many :prices
  validates :ticker, presence: true, uniqueness: true
  validates :webpage, url: true, presence: true
  validates :address, presence: true
  validates :overview, presence: true, length: { minimum: 20 }
end
