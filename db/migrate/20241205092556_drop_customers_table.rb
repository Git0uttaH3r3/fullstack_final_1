class DropCustomersTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :customers
  end

  def down
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :province
      t.timestamps
    end
  end
end
