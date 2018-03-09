require 'rails_helper'

RSpec.describe User, type: :model do

  it "is valid with an email and a password" do
    user = User.new(email: "test@example.com", password: "password")
    expect(user).to be_valid
  end

  it "is invalid without an email" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid without a password" do
   user = User.new(password: "")
   user.valid?
   expect(user.errors[:password]).to include("can't be blank")
  end

  it "is invalid with a duplicate email address" do
    user = User.create(email: "tester@example.com", password: "password")
    other_user = User.new(email: "tester@example.com")
    other_user.valid?
    expect(other_user.errors[:email]).to include("has already been taken")
  end

  it "is not an admin by default" do
    user = User.create(email: "tester@example.com", password: "password")
    expect(user.admin).to be false
  end
end
