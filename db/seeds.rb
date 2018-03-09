# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
Stock.destroy_all

p "calling api"

stocks = StockQuote::Stock.quote("aapl,amzn,msft,tsla")

p "creating stocks"

stocks.each do |st|
  stock = Stock.new(ticker: st.t, name: st.name, price: st.l * 100)
  stock.save!
end

p "stocks created"
