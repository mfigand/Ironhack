require "sinatra"
require "sinatra/reloader" 
require "Imdb"
require_relative "./lib/movie_lovers.rb"
# require_relative "./lib/Fakemovie_lovers.rb"


get "/" do 
  erb(:home)
end

post "/search" do
  s = Search.new(params[:searchWord])
  @nineMovieArray = s.selector
  @year = (@nineMovieArray.sample).year
  # binding.pry
  erb(:posters)
end

post "/answer" do
  if params[:choosenYear] == params[:correctYear] 
   "correct"
    # erb(:correct)
  else
    "incorrect"
    # erb(:incorrect)
  end
end