require "rails_helper"

RSpec.feature "ListingStocks", type: :feature do
  let!(:stock) { Stock.create(ticker: "TEST",
                            name: "test",
                            webpage: "http://test.com",
                            address: "1 Test way, PALO ALTO, CA 95014-0645, United States",
                            overview: "a" * 20) }

  let!(:price1) { Price.create(date: Date.today, price: 20, growth: 1.2, stock: stock) }
  scenario "all users have access to stock's own page" do
    visit root_path
    find('.stock-index').click_link("test")
    aggregate_failures do
      expect(page).to have_current_path(stock_path(stock))
      expect(page).to have_content(stock.ticker)
      expect(page).to have_content(stock.address)
      expect(page).to have_content(stock.overview)
      expect(page).to have_link(stock.webpage)
      #testing contents of the table
      expect(page).to have_selector("tbody tr", count: 1)
      table = find(:css, "table")
      expect(table).to have_content(Date.today)
      expect(table).to have_content(price1.growth)
      expect(table).to have_content(price1.price)

      expect(page).to have_css("div#chart")
    end
  end
end
