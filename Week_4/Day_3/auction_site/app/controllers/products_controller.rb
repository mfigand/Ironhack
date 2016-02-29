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
    @user = User.find params[:user_id]

    @product = @user.products.new product_params

    if @product.save
      flash[:notice] = "Product created succesfully"
      redirect_to action: :index, user_id: @user.id
    else
      flash[:alert] = "ALERT product not created"
      render 'new'
    end

  end

  def destroy

  end

  
end
