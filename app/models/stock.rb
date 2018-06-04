class Stock < ApplicationRecord
  has_many :prices
  validates :name, presence: true, uniqueness: true
  validates :ticker, presence: true, uniqueness: true, format: { with: /\A[A-Z]+\z/, message: "only allows uppercase letters" }
  validates :webpage, url: true, presence: true
  validates :industry, presence: true
  validates :overview, presence: true, length: { minimum: 20 }
end
