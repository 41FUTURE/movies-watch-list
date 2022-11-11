class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @list = List.find(params[:list_id])
    @review.list = @list
    @review.save
    redirect_to @review.list
  end

  def new
    @review = Review.new
    @list = List.find(params[:list_id])
  end

  private

  def review_params
    params.require(:review).permit(:product_id, :description, :rating)
  end
end
