class CreateCustomers < ActiveRecord::Migration[7.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :password

      t.timestamps
    end
    add_index :customers, :email, unique: true
  end
end
