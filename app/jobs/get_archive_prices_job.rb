class GetArchivePricesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    p "calling api"
    stocks_names = ["aapl", "amzn", "msft", "tsla"]
    # getting the data of yesterday's open, close, high, low data
    # returns the stock's daily high, low, open, close price of the last month - not possible to get back only yesterday's data
    # with "1d", it returns the data for the whole day for each minute
    chart_data = StockQuote::Stock.batch("chart", stocks_names, "1m")

    p "creating prices"
    chart_data.each do |month|
      if month.response_code == 200 && !month.chart.empty?
        yesterday = month.chart.last
        price = Price.new(high: yesterday["high"],
                          low: yesterday["low"],
                          open: yesterday["open"],
                          close: yesterday["close"],
                          date: yesterday["date"])
        price.stock = Stock.where(ticker: month.symbol)[0]
        price.save!
      else
        p "Price could not be created. Error code: #{month.response_code}"
      end
    end

    p "prices created"
  end
end
