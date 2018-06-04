require 'rails_helper'

RSpec.describe Price, type: :model do

  let(:stock) { Stock.create(ticker: "TEST",
                            name: "test",
                            webpage: "http://test.com",
                            industry: "Test industry",
                            overview: "a" * 20) }

  let(:exchange_date) { ExchangeDate.create(date: Date.today) }

  it "is valid with a daily open, close, high, low, a stock and a date" do
    pr = Price.new(open: 52.4,
                  close: 40.45,
                  high: 53.52,
                  low: 38.7,
                  exchange_date: exchange_date,
                  stock: stock)
    expect(pr).to be_valid
  end

  it { is_expected.to validate_presence_of(:open) }
  it { is_expected.to validate_presence_of(:close) }
  it { is_expected.to validate_presence_of(:high) }
  it { is_expected.to validate_presence_of(:low) }
  it { is_expected.to belong_to(:stock) }
  it { is_expected.to belong_to(:exchange_date) }
end
