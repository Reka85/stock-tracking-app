require 'rails_helper'

RSpec.describe Stock, type: :model do
  it "is valid with a ticker and a name" do
    stock = Stock.new(ticker: "TEST",
                      name: "test",
                      webpage: "http://test.com",
                      address: "1 Test way, PALO ALTO, CA 95014-0645, United States",
                      overview: "a" * 20)
    expect(stock).to be_valid
  end

  it { is_expected.to validate_presence_of(:ticker) }
  it { is_expected.to validate_presence_of(:webpage) }
  it { is_expected.to validate_presence_of(:address) }
  it { should validate_length_of(:overview).is_at_least(20) }
  it { is_expected.to validate_uniqueness_of(:ticker) }
  it { is_expected.to have_many :prices }
end
