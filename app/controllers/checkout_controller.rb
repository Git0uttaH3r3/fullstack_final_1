class CheckoutController < ApplicationController
  def index
    @cart_items = current_cart.map do |lego_set_id, quantity|
      lego_set = LegoSet.find(lego_set_id)
      { lego_set: lego_set, quantity: quantity }
    end

    @user = current_user || User.new
  end

  def create
    if current_user.address.blank? || current_user.province.blank?
      redirect_to edit_user_registration_path, alert: "Please update your address and province to proceed with checkout."
      return
    end

    taxes, total_price = calculate_taxes_and_total(current_cart, current_user.province)

    order = current_user.orders.create!(
      total_price: total_price,
      status: "pending",
      address: current_user.address,
      province: current_user.province,
      taxes: taxes
    )

    current_cart.each do |lego_set_id, quantity|
      lego_set = LegoSet.find(lego_set_id)
      order.order_items.create!(
        lego_set: lego_set,
        quantity: quantity,
        price_at_purchase: lego_set.price
      )
    end

    session[:cart] = {}
    redirect_to root_path, notice: "Order successfully placed! Invoice sent to your email."
  end



  private

  def current_cart
    session[:cart] ||= {}
  end

  private

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
