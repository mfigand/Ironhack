require "sinatra"
require "sinatra/reloader" if development?
enable(:sessions)


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

get "/users/:username" do
  @usernaem = params[:username]
  erb(:user_profile)
end

get "/sum/:num1/:num2" do
  @num1 = params[:num1]
  @num2 = params[:num2]
  erb(:user_profile)
end

get "/hours/:time/:hour" do
  @time = params[:time]
  @hour = params[:hour]
  hoursAgo = Time.now.strftime("%H").to_i - @hour.to_i
  hoursAhead = Time.now.strftime("%H").to_i + @hour.to_i
  if @time == "ago" 
      @newHour = hoursAgo 
  elsif @time == "ahead"
      @newHour = hoursAhead
  end
  erb(:time)
end

get "/hot-dog" do
  @ingredients = ["hot1", "hot2", "hot"]
  @hola = "hola"
  erb(:hot_dog)
end

get "/foo" do
  status(418)
  "I´m a tea pott!"
end

get "/session_test" do
  session[:saved_value]
end

get "/session_test/:text" do
  text = params[:text]
  session[:saved_value] = text
end








