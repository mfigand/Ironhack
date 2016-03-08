class ReviewsController < ApplicationController

  def index
    # binding.pry
    @product = Product.find(params[:product_id])
    @review = @product.reviews.all

  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)

    if @review.save
      redirect_to action: 'index'

    else
      # render '/users/'+params[:user_id]+'/products/'+params[:id]
      # redirect_to action: 'show', controller: 'products'
      redirect_to user_product_path(current_user, @product)
    end

  end

  private

  def review_params
    params.require(:review).permit(:description)
  end
end
