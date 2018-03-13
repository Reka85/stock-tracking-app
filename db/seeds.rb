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

p "creating today's prices.."

stocks.each_with_index do |stock, index|
  new_price = Price.new(price: stock.l, growth: stock.c, date: Date.today, stock: all_stocks[index])
  new_price.save!
end

p "creating last 5 day's prices.."

stock_symbols = ["aapl","amzn","msft","tsla"]


last_5_days_all_stocks = []

# we request the 5 day history of each stock (no stock market on weekends and holidays!)
# the data sent back (stock_history) is a hash like: {:symbol=>"amzn", :history=>[{:date=>"12-Mar-18", :open=>1592.6,...
# it does not send back growth
stock_symbols.each do |symbol|
  stock_history = StockQuote::Stock.history(symbol, 5.days.ago, Date.today)
  last_5_days_all_stocks << stock_history
end

last_5_days_all_stocks.each do |stock|
  stock_name = Stock.find_by(ticker: stock[:symbol].upcase)
  stock[:history].each do |day|
    price = Price.new(price: day[:close], date: Date.parse(day[:date]), stock: stock_name)
    price.save!
  end
end

p "prices created"
