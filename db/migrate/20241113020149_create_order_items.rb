class CreateOrderItems < ActiveRecord::Migration[7.2]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :lego_set, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :price_at_purchase

      t.timestamps
    end
  end
end