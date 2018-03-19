require "rails_helper"

RSpec.feature "ListingStocks", type: :feature do
  let!(:stock_1) { Stock.create(ticker: "TEST_1",
                            name: "test1",
                            webpage: "http://test1.com",
                            address: "1 Test way, PALO ALTO, CA 95014-0645, United States",
                            overview: "a" * 20) }

  let!(:stock_2) { Stock.create(ticker: "TEST_2",
                            name: "test2",
                            webpage: "http://test2.com",
                            address: "1 Test way, PALO ALTO, CA 95014-0645, United States",
                            overview: "a" * 20) }
  scenario "all users have access to stocks home page" do
    visit root_path
    aggregate_failures do
      expect(page).to have_content "All stocks"
      # testing the contents of the dropdown menu
      drop_down = find(:css, ".dropdown-menu")
      expect(drop_down).to have_link("test1")
      expect(drop_down).to have_link("test2")
      expect(drop_down).to have_selector('li', count: 2)
      # testing main page's contents
      main_page = find(:css, "#stocks")
      expect(main_page).to have_link("test1")
      expect(main_page).to have_link("test2")
      expect(main_page).to have_selector('.stock-index', count: 2)
    end
  end
end
