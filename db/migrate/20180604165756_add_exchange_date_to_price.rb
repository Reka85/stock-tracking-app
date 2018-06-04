class AddExchangeDateToPrice < ActiveRecord::Migration[5.1]
  def change
    add_reference :prices, :exchange_date, foreign_key: true
  end
end
