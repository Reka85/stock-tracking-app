require 'rails_helper'

RSpec.describe Price, type: :model do

  let(:stock) { Stock.create(ticker: "TEST", name: "test") }

  it "is valid with a price, a growth, a stock and a date" do
    pr = Price.new(price: 20.0, growth: 1.2, date: Date.today, stock: stock)
    expect(pr).to be_valid
  end

  it { is_expected.to validate_presence_of(:price) }
  it { is_expected.to validate_presence_of(:growth) }
  it { is_expected.to validate_presence_of(:date) }
  it { is_expected.to belong_to(:stock) }
end
