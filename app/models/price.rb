class Price < ApplicationRecord
  belongs_to :stock
  belongs_to :exchange_date
  validates :open, presence: true
  validates :close, presence: true
  validates :high, presence: true
  validates :low, presence: true
end
