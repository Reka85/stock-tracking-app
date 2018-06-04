class AddColumnsToPrices < ActiveRecord::Migration[5.1]
  def change
    add_column :prices, :open, :decimal, precision: 8, scale: 3
    add_column :prices, :close, :decimal, precision: 8, scale: 3
    add_column :prices, :high, :decimal, precision: 8, scale: 3
    add_column :prices, :low, :decimal, precision: 8, scale: 3
  end
end
