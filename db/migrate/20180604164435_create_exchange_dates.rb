class CreateExchangeDates < ActiveRecord::Migration[5.1]
  def change
    create_table :exchange_dates do |t|
      t.date :date

      t.timestamps
    end
  end
end
