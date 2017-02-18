class ReviewsController < ApplicationController
  def create
    @product = Product.find params[:product_id]
    @review = @product.review.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to "/products/#{@review.product_id}"
    else
      @reviews = @product.review.reverse
      @new_review = @review
      render '/products/show', id: [:product_id]
    end
  end

  def destroy
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
