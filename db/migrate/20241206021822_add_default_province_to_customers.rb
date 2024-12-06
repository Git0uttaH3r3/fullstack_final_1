class AddDefaultProvinceToCustomers < ActiveRecord::Migration[7.2]
  def change
    change_column_default :customers, :province, from: nil, to: "MB"
  end
end
