class PagesController < ApplicationController
  def home
    @featured_lego_sets = LegoSet.limit(4) # Adjust the limit as needed
  end
end
