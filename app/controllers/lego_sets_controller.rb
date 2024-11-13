class LegoSetsController < ApplicationController
  def index
    @lego_sets = LegoSet.page(params[:page]).per(10)
  end
  def show
    @lego_set = LegoSet.find(params[:id])
    @reviews = @lego_set.reviews
  end
end
