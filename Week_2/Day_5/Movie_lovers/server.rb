
require "sinatra"
require "sinatra/reloader" 
require "imdb"
require_relative "../lib/movie_lovers.rb"
enable(:sessions)



get "/" do
   "hola"
end


