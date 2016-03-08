class UsersController < ApplicationController

  def index

  end

  def show

  end

  def create
    @user = User.find params[:user_id]
    @product = @user.products.new entry_params

    if @product.save
      flash[:notice] = "Product created succesfully"
      redirect_to action: :index, user_id: @product.id
    else
      flash[:alert] = "ALERT product not created"
      render 'new'
    end

  end

  def destroy

  end

  def new

  end
end
