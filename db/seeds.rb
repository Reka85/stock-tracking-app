# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

Price.destroy_all
Stock.destroy_all
ExchangeDate.destroy_all

p "calling api"

#fetching general data about the companies
stocks_names = ["aapl", "amzn", "msft", "tsla"]
stock_objs = []

stocks_names.each do |stock_name|
  stock = StockQuote::Stock.company(stock_name)
  stock_objs << stock
end

p "creating stocks.."

stock_objs.each do |stock|
  if stock && stock.response_code == 200
    new_stock = Stock.new(ticker: stock.symbol,
                          name: stock.company_name,
                          industry: stock.industry,
                          webpage: stock.website,
                          overview: stock.description)
    new_stock.save!
  else
    p "Stocks could not be created. Error code: #{stock.response_code}"
  end
end

p "stocks created"

p "creating dates"

#returns the stock's daily high, low, open, close price of the last month
chart_data = StockQuote::Stock.batch("chart", stocks_names, "1m")

if chart_data.first.response_code == 200 && !chart_data.first.chart.empty?
  chart_data.first.chart.each do |day|
    date = ExchangeDate.new(date: day["date"])
    date.save!
  end
else
  p "Exchange dates could not be created. Error code: #{chart_data.first.response_code}"
end
p "dates created"

p "creating prices"
chart_data.each do |month|
  if month.response_code == 200 && !month.chart.empty?
    month.chart.each do |day|
      price = Price.new(high: day["high"],
                        low: day["low"],
                        open: day["open"],
                        close: day["close"])
      price.exchange_date = ExchangeDate.where(date: day["date"])[0]
      price.stock = Stock.where(ticker: month.symbol)[0]
      price.save!
    end
  else
    p "Price could not be created. Error code: #{month.response_code}"
  end
end

p "prices created"

p "end of seed"
