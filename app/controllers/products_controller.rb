class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = @product.review.reverse
    @new_review = Review.new(:product=>@product)
  end

end
