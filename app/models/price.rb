class Price < ApplicationRecord
  belongs_to :stock
  validates :open, presence: true
  validates :close, presence: true
  validates :high, presence: true
  validates :low, presence: true
  validates :date, presence: true
end
