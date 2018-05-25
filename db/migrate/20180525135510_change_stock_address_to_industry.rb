class ChangeStockAddressToIndustry < ActiveRecord::Migration[5.1]
  def change
    rename_column :stocks, :address, :industry
  end
end
