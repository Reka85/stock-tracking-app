class CreatePrices < ActiveRecord::Migration[5.1]
  def change
    create_table :prices do |t|
      t.date :date
      t.decimal :price, precision: 12, scale: 4
      t.decimal :growth, precision: 7, scale: 4

      t.timestamps
    end
  end
end
