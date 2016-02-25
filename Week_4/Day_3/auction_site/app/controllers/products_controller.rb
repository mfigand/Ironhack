class ProductsController < ApplicationController

  def index

  end

  def new
    @user = User.find params[:user_id]
    @product = @user.products.new

  end

  def show

  end

  def create
    # @user = User.find params[:product_id]
    # @product = @user.products.new products_params
    #
    # if @product.save
    #   redirect_to action: :index
    # else
    #   render "new"
    # end

  end

  def destroy

  end
end
