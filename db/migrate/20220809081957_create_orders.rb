class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :total_price
      t.integer :total_quantity
      t.integer :status
      t.boolean :payment_mode
      t.references :user
      t.timestamps
    end
  end
end
