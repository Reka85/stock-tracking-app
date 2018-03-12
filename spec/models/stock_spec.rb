require 'rails_helper'

RSpec.describe Stock, type: :model do
  it "is valid with a ticker and a name" do
    stock = Stock.new(ticker: "TEST", name: "test")
    expect(stock).to be_valid
  end

  it { is_expected.to validate_presence_of(:ticker) }
  it { is_expected.to validate_uniqueness_of(:ticker) }
  it { is_expected.to have_many :prices }
end
