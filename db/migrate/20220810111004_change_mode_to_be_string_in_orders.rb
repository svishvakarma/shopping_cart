class ChangeModeToBeStringInOrders < ActiveRecord::Migration[7.0]
  def change
    change_column :orders, :payment_mode, :string

  end
end
