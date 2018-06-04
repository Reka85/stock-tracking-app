class RemoveColumnsFromPrices < ActiveRecord::Migration[5.1]
  def change
    remove_column :prices, :date
    remove_column :prices, :growth
    remove_column :prices, :price
  end
end
