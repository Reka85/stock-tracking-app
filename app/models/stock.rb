class Stock < ApplicationRecord
  has_many :prices
  validates :ticker, presence: true, uniqueness: true
  validates :webpage, url: true, presence: true
  validates :industry, presence: true
  validates :overview, presence: true, length: { minimum: 20 }
end
