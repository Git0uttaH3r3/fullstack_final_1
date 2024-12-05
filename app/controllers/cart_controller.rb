class CartController < ApplicationController
  def show
    @cart_items = current_cart.map do |lego_set_id, quantity|
      lego_set = LegoSet.find(lego_set_id)
      { lego_set: lego_set, quantity: quantity }
    end
  end

  def update
    cart = current_cart
    lego_set_id = params[:lego_set_id]
    quantity = params[:quantity].to_i

    if cart[lego_set_id].nil?
      redirect_to cart_path, alert: "Item not found in the cart."
      return
    end

    if quantity <= 0
      cart.delete(lego_set_id)
    else
      cart[lego_set_id] = quantity
    end

    session[:cart] = cart
    redirect_to cart_path, notice: "Cart updated successfully!"
  end

  def add
    cart = current_cart
    lego_set_id = params[:lego_set_id]
    cart[lego_set_id] ||= 0
    cart[lego_set_id] += 1
    session[:cart] = cart

    redirect_to cart_path, notice: "Item added to cart!"
  end

  def remove
    cart = current_cart
    lego_set_id = params[:lego_set_id]
    cart.delete(lego_set_id)

    session[:cart] = cart
    redirect_to cart_path, notice: "Item removed from cart."
  end

  private

  def current_cart
    session[:cart] ||= {}
  end
end
