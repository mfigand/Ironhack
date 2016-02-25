Rails.application.routes.draw do

  # get '/' => 'site#home'

  resources :users, only: [:index, :show, :create, :destroy, :new] do
    resources :products, only: [:index, :new, :show, :create, :destroy]
  end

end
