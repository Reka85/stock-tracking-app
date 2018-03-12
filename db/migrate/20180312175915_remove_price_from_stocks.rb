class RemovePriceFromStocks < ActiveRecord::Migration[5.1]
  def change
    remove_column :stocks, :price, :decimal
  end
end
