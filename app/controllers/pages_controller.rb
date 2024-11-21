class PagesController < ApplicationController
  def home
    @featured_lego_sets = LegoSet.limit(5)
    @recent_lego_sets = LegoSet.order(created_at: :desc).limit(5)
  end
end
