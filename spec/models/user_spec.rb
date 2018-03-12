require 'rails_helper'

RSpec.describe User, type: :model do

  it "is valid with an email and a password" do
    user = User.new(email: "test@example.com", password: "password")
    expect(user).to be_valid
  end

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password) }

  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

  it "is not an admin by default" do
    user = User.create(email: "tester@example.com", password: "password")
    expect(user.admin).to be false
  end
end
