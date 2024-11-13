class LegoSetsController < ApplicationController
  def index
    @lego_sets = LegoSet.all
  end

  def show
    @lego_set = LegoSet.find(params[:id])
    @reviews = @lego_set.reviews
  end
end
