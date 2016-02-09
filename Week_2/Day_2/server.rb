require "sinatra"

get "/" do 
  "<h1>My first Sinatra app.<h1>"
end

get "/hi" do
  @greeting = "Hello, world!"
  erb(:hipage)
end

get "/hi/about" do
  erb(:author)
end

get "/pizza" do
  @ingredients = ["cheese", "pepperoni", "mushrooms"]
  erb(:pizza)
end