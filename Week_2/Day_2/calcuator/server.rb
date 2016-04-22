require "sinatra"
require "sinatra/reloader" if development?
require "pry"
require_relative "./lib/Calculator.rb"
enable(:sessions)


get "/add" do
  erb(:add)
end

get "/calculate_add" do
  "params data: " + params.inspect
  erb(:add)

end

post "/calculate" do
  c = Calculator.new(params[:first], params[:second])
  functions = params[:btn]
  if functions == "add"
    c.add
  "The addition of #{params[:first]} and #{params[:second]} is #{c.add}"
  elsif functions == "substract"
    c.substract
    "The substract of #{params[:first]} minus #{params[:second]} is #{c.substract}"
  elsif functions == "multiply"
    c.multiply
      "The multiply of #{params[:first]} per #{params[:second]} is #{c.multiply}"
  elsif functions == "divide"
    c.divide
  "The result of #{params[:first]} divided by #{params[:second]} is #{c.divide}"

  end
end
