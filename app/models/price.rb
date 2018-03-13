class Price < ApplicationRecord
  belongs_to :stock
  validates :price, presence: true
  #validates :growth, presence: true
  validates :date, presence: true
end
