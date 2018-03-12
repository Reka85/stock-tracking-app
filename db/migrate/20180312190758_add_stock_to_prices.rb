class AddStockToPrices < ActiveRecord::Migration[5.1]
  def change
    add_reference :prices, :stock, foreign_key: true
  end
end
