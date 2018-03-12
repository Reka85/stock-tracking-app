# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
Price.destroy_all
Stock.destroy_all

p "calling api"

stocks = StockQuote::Stock.quote("aapl,amzn,msft,tsla")

p "creating stocks.."

stocks.each do |stock|
  new_stock = Stock.new(ticker: stock.t, name: stock.name)
  new_stock.save!
end

p "stocks created"

all_stocks = Stock.all

p "creating prices.."

stocks.each_with_index do |stock, index|
  new_price = Price.new(price: stock.l, growth: stock.c, date: Date.today, stock: all_stocks[index])
  new_price.save!
end

p "prices created"
