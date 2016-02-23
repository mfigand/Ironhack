Rails.application.routes.draw do

  get '/' => 'contacts#index'

  get "/contact" => "contacts#new"

  Rails.application.routes.draw do

    post("/contacts", :to => "contacts#index")
  end

end
