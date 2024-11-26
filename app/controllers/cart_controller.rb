class CartController < ApplicationController
  def show
    @cart_items = current_cart.map do |lego_set_id, quantity|
      lego_set = LegoSet.find(lego_set_id)
      { lego_set: lego_set, quantity: quantity }
    end
  end

  def add
    add_to_cart(params[:lego_set_id])
    redirect_to request.referer, notice: "Added to cart!"
  end

  def remove
    remove_from_cart(params[:lego_set_id])
    redirect_to cart_path, notice: "Removed from cart."
  end
end

