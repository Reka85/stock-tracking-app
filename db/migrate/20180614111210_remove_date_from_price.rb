class RemoveDateFromPrice < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :prices, column: :exchange_date_id
  end
end
