class LegoSetsController < ApplicationController
  def index
    @lego_sets = LegoSet.all

    if params[:query].present?
      @lego_sets = @lego_sets.where("title LIKE ?", "%#{params[:query]}%")
    end

    if params[:category]
      @lego_sets = LegoSet.where(category_id: params[:category])
    else
      @lego_sets = LegoSet.all
    end

    @lego_sets = @lego_sets.page(params[:page]).per(10)
  end
  def show
    @lego_set = LegoSet.find(params[:id])
    @reviews = @lego_set.reviews
  end
end
