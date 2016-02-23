Rails.application.routes.draw do
 get '/' => 'link#home'

 post "/shortlink" => "link#shortlink"

 get "/:shortlink" => "link#show"
end
