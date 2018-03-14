class AddColumnsToStock < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :address, :string
    add_column :stocks, :webpage, :string
    add_column :stocks, :overview, :text
  end
end
