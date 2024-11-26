class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  helper_method :current_cart

  def current_cart
    session[:cart] ||= {}
  end

  def add_to_cart(lego_set_id)
    cart = current_cart
    cart[lego_set_id.to_s] ||= 0
    cart[lego_set_id.to_s] += 1
    session[:cart] = cart
  end

  def remove_from_cart(lego_set_id)
    cart = current_cart
    cart.delete(lego_set_id.to_s)
    session[:cart] = cart
  end
end
