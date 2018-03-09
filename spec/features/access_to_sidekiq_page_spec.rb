require 'rails_helper'

RSpec.feature "AccessToSidekiqPage", type: :feature do
  before do
    @user = User.create(email: "tester@example.com", password: "password")
    visit "/sidekiq"
  end
  scenario "admin user has access to sidekiq page" do
    @user.admin = true
    @user.save

    expect(page).to have_current_path new_user_session_path

    fill_in "Email", with: "tester@example.com"
    fill_in "Password", with: "password"
    click_button "Log in"

    expect(page).to have_current_path "/sidekiq/"
  end

  scenario "not admin user has no access to sidekiq page" do
    expect(page).to have_current_path new_user_session_path

    expect{
      fill_in "Email", with: "tester@example.com"
      fill_in "Password", with: "password"
      click_button "Log in"
    }.to raise_error(ActionController::RoutingError)
  end
end
