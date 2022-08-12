class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :discription
      t.integer :price
      t.references :user
      t.timestamps
    end
  end
end
