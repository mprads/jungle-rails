class ReviewsController < ApplicationController
  before_filter :authorize
  def create
    @product = Product.find params[:product_id]
    @review = @product.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to "/products/#{@review.product_id}"
    else
      @reviews = @product.reviews.all.reverse
      @new_review = @review
      render '/products/show', id: [:product_id]
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to "/products/#{@review.product_id}"
  end

  private
  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end
end
