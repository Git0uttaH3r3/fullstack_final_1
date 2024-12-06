class CheckoutController < ApplicationController
  def index
    @cart_items = current_cart.map do |lego_set_id, quantity|
      lego_set = LegoSet.find(lego_set_id)
      { lego_set: lego_set, quantity: quantity }
    end

    @customer = current_user || Customer.new
  end

  def create
    # Check if a user is logged in and use their details to create or find a Customer
    customer = if current_user
                 Customer.find_or_create_by!(email: current_user.email) do |cust|
                   cust.name = "Guest User" # Default name
                   cust.address = current_user.address
                   cust.province = current_user.province
                   cust.password = SecureRandom.hex(8) # Assign a random password
                 end
               else
                 Customer.create!(
                   name: params.dig(:customer, :name),
                   email: params.dig(:customer, :email),
                   address: params.dig(:customer, :address),
                   province: params.dig(:customer, :province),
                   password: SecureRandom.hex(8) # Assign a random password
                 )
               end

    # Calculate taxes and total price
    province = customer.province
    taxes, total_price = calculate_taxes_and_total(current_cart, province)

    # Create the order and associate it with the customer
    order = customer.orders.create!(total_price: total_price, status: "pending")

    # Create order items
    current_cart.each do |lego_set_id, quantity|
      lego_set = LegoSet.find(lego_set_id)
      order.order_items.create!(
        lego_set: lego_set,
        quantity: quantity,
        price_at_purchase: lego_set.price
      )
    end

    # Clear the cart and redirect with a success message
    session[:cart] = {}
    redirect_to root_path, notice: "Order successfully placed! Invoice sent to your email."
  end



  private

  def current_cart
    session[:cart] ||= {}
  end

  def calculate_taxes_and_total(cart, province)
    gst = 0.05
    pst = case province
          when "MB" then 0.07
          when "ON" then 0.08
          else 0
          end
    hst = case province
          when "ON", "NB", "NS", "NL" then 0.13
          else 0
          end

    subtotal = cart.sum { |lego_set_id, quantity| LegoSet.find(lego_set_id).price * quantity }
    taxes = subtotal * (gst + pst + hst)
    total = subtotal + taxes

    [taxes, total]
  end
end
