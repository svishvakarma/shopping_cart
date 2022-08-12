class CreateLineitems < ActiveRecord::Migration[7.0]
  def change
    create_table :lineitems do |t|
      t.integer :price
      t.integer :quantity
      t.references :product
      t.references :user
      t.references :order
      t.timestamps
    end
  end
end
