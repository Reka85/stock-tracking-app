class StocksController < ApplicationController
  def index
    @stocks = Stock.all
  end

  def show
    @stocks = Stock.all
    @stock = Stock.find(params[:id])
    @prices = @stock.prices.last(7).reverse
    @webpage_short = @stock.webpage.match(/(?<=\/\/).+/)
  end
end
