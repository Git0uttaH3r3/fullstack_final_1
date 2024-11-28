class PagesController < ApplicationController
  def home
    @featured_lego_sets = LegoSet.limit(5)
    @recent_lego_sets = LegoSet.order(created_at: :desc).limit(5)
    @recently_updated_lego_sets = LegoSet.where(updated_at: 3.days.ago..Time.current).order(updated_at: :desc)
  end
end
