require 'rails_helper'

RSpec.describe ExchangeDate, type: :model do
  it "is valid with a date" do
    date = ExchangeDate.new(date: Date.today)
    expect(date).to be_valid
  end

  it { is_expected.to validate_presence_of(:date)}
  it { is_expected.to have_many :prices }
end
