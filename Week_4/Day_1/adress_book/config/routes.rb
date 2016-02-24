Rails.application.routes.draw do

  get '/' => 'contacts#index'

<<<<<<< HEAD
  get "/contacts" => "contacts#new"

  post "/contacts" => "contacts#index"

  get '/contacts/:id' => "contacts#show"

=======
  get "/contact" => "contacts#new"

  Rails.application.routes.draw do

    post("/contacts", :to => "contacts#index")
  end
>>>>>>> b791b06f89bddbf71edd02ad19ba4a4d07bcdb15

end
