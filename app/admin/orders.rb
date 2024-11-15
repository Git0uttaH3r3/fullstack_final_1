ActiveAdmin.register Order do
  permit_params :customer_id, :total_price, :status, :created_at

  form do |f|
    f.inputs "Order Details" do
      f.input :customer_id, as: :select, collection: Customer.all.collect { |customer| [customer.name, customer.id] }
      f.input :total_price
      f.input :status, as: :select, collection: ["pending", "shipped", "completed", "canceled"]
      f.input :created_at, as: :datetime_picker
    end
    f.actions
  end
end
