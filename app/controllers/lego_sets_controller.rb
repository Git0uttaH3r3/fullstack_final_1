class LegoSetsController < ApplicationController
  def index
    # Search Lego sets by title
    @lego_sets = if params[:query].present?
                   LegoSet.where("title ILIKE ?", "%#{params[:query]}%")
                 else
                   LegoSet.all
                 end

    # Sort Lego sets by price (high to low or low to high)
    if params[:sort] == "price_high_to_low"
      @lego_sets = @lego_sets.order(price: :desc)
    elsif params[:sort] == "price_low_to_high"
      @lego_sets = @lego_sets.order(price: :asc)
    end

    # Paginate results
    @lego_sets = @lego_sets.page(params[:page]).per(10)
  end
  def show
    @lego_set = LegoSet.find(params[:id])
    @reviews = @lego_set.reviews
  end
end
