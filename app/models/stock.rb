class Stock < ApplicationRecord
  has_many :prices
  validates :ticker, presence: true, uniqueness: true
  validates :webpage, url: true
end
