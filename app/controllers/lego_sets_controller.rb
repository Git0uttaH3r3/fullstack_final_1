class LegoSetsController < ApplicationController
  def index
    @lego_sets = LegoSet.all

    # Search by name
    if params[:query].present?
      @lego_sets = @lego_sets.where("title LIKE ?", "%#{params[:query]}%")
    end

    # Filter by category
    if params[:category].present? && params[:category] != "all"
      @lego_sets = @lego_sets.where(category: params[:category])
    end

    # Paginate results
    @lego_sets = @lego_sets.page(params[:page]).per(10)
  end
  def show
    @lego_set = LegoSet.find(params[:id])
    @reviews = @lego_set.reviews
  end
end
