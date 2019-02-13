class ReviewsController < ApplicationController#
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Restaurant.new(review_params)
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    @review.save
    redirect_to restaurants_path(@review)
  end

  private
  def review_params
    params.require(:review).permit(:content, :stars)
  end

end
