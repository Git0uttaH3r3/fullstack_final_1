ActiveAdmin.register OrderItem do
  permit_params :order_id, :lego_set_id, :quantity, :price_at_purchase

  form do |f|
    f.inputs "Order Item Details" do
      f.input :order_id, as: :select, collection: Order.all.collect { |order| [order.id, order.id] }
      f.input :lego_set_id, as: :select, collection: LegoSet.all.collect { |lego_set| [lego_set.title, lego_set.id] }
      f.input :quantity
      f.input :price_at_purchase
    end
    f.actions
  end
end

