Rails.application.routes.draw do
  get '/' => 'tournaments#index'

  get '/api/tournaments' => 'tournaments#show_list_tournaments'

  post '/api/tournaments' => 'tournaments#create'

  delete '/api/tournaments' => 'tournaments#delete'

  post '/api/tournaments/:tournament_id/players' => 'players#create'


end
