class AddDateToPrice < ActiveRecord::Migration[5.1]
  def change
    add_column :prices, :date, :date
  end
end
