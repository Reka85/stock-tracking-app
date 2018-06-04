require 'rails_helper'

RSpec.describe Stock, type: :model do
  it "is valid with a ticker, a name, an overview, an industry and a webpage" do
    stock = Stock.new(ticker: "TEST",
                      name: "test",
                      webpage: "http://test.com",
                      industry: "Test industry",
                      overview: "a" * 20)
    expect(stock).to be_valid
  end

  it { is_expected.to validate_presence_of(:ticker) }
  it { is_expected.to validate_presence_of(:webpage) }
  it { is_expected.to validate_presence_of(:industry) }
  it { is_expected.to validate_presence_of(:name) }
  it { should validate_length_of(:overview).is_at_least(20) }
  it { is_expected.to validate_uniqueness_of(:ticker) }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to have_many :prices }
  it { should_not allow_value("abcd").for(:ticker) }
end
