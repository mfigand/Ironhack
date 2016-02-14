require "sinatra"
require "sinatra/reloader" 
require "Imdb"
require_relative "./lib/movie_lovers.rb"


get "/" do 
  erb(:home)
end

post "/search" do
  s = Search.new(params[:searchWord])
  @nineMovieArray = s.selector
  if @nineMovieArray.class == String 
   erb(:fail)
  else
    @year = (@nineMovieArray.sample).year
    erb(:posters)
  end
end

post "/answer" do
  if params[:choosenYear] == params[:correctYear] 
    erb(:correct)
  else
    erb(:incorrect)
  end
end