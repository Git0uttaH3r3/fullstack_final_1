class ReviewsController < ApplicationController
  def create
    @lego_set = LegoSet.find(params[:lego_set_id])
    @review = @lego_set.reviews.build(review_params)

    if @review.save
      flash[:notice] = "Thank you for your review!"
      redirect_to lego_set_path(@lego_set)
    else
      flash[:alert] = "There was an error with your review. Please try again."
      render "lego_sets/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:name, :rating, :review)
  end
end
