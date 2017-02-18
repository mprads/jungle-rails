class ReviewsController < ApplicationController
  def create
    @product = Product.find params[:product_id]
    @review = @product.review.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to "/products/#{@review.product_id}"
    else
      redirect_to "/products/#{@review.product_id}"
    end
  end
  private
  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end
end
