class ChangeColumn3 < ActiveRecord::Migration[7.0]
  def change
    change_column :orders, :total_price, :integer
    change_column :orders, :total_quantity, :integer
  end
end
