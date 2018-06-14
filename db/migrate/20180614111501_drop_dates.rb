class DropDates < ActiveRecord::Migration[5.1]
  def change
    drop_table :exchange_dates
  end
end
