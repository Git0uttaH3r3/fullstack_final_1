class LegoSetsController < ApplicationController
  def index
    @lego_sets = if params[:query].present?
                   LegoSet.where("title LIKE ?", "%#{params[:query]}%")
                 else
                   LegoSet.all
                 end

    if params[:sort] == "price_high_to_low"
      @lego_sets = @lego_sets.order(price: :desc)
    elsif params[:sort] == "price_low_to_high"
      @lego_sets = @lego_sets.order(price: :asc)
    end
    if params[:category].present?
      @lego_sets = @lego_sets.where(category: params[:category])
    end

    @lego_sets = @lego_sets.page(params[:page]).per(10)
  end
  def show
    @lego_set = LegoSet.find(params[:id])
    @reviews = @lego_set.reviews
  end
end
