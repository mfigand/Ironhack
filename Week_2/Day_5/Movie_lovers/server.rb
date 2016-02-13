require "sinatra"
require "sinatra/reloader" 
require "Imdb"
require_relative "./lib/movie_lovers.rb"
# enable(:sessions)

get "/" do 
  erb(:home)
end

post "/search" do
  s = Search.new(params[:searchWord])
  @nineMovieArray = s.selector
  @year = (@nineMovieArray.sample).year
  erb(:posters)
end