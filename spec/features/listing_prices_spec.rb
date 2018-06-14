require "rails_helper"

RSpec.feature "ListingPrices", type: :feature do
  let!(:stock) { Stock.create(ticker: "TEST",
                            name: "test",
                            webpage: "http://test.com",
                            industry: "Test industry",
                            overview: "a" * 20) }

  let!(:price1) { Price.create(open: 52.4,
                  close: 40.45,
                  high: 53.52,
                  low: 38.7,
                  date: Date.today,
                  stock: stock) }
  scenario "all users have access to stock's own page" do
    visit root_path
    find('.stock-index').click_link("test")
    aggregate_failures do
      expect(page).to have_current_path(stock_path(stock))
      expect(page).to have_content(stock.ticker)
      expect(page).to have_content(stock.industry)
      expect(page).to have_content(stock.overview)
      expect(page).to have_link(stock.webpage.match(/(?<=\/\/).+/))
      #testing contents of the table
      expect(page).to have_selector("tbody tr", count: 1)
      table = find(:css, "table")
      expect(table).to have_content(Date.today)
      expect(table).to have_content(price1.high)
      expect(table).to have_content(price1.low)
      expect(table).to have_content(price1.open)
      expect(table).to have_content(price1.close)

      expect(page).to have_css("div#chart")
    end
  end
end
