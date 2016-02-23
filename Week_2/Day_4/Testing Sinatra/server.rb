require 'sinatra'

get '/' do
  'Hellow, World!'
end

get '/real_page' do
  'Ther other page'
end

get '/hi' do
  redirect 'real_page'#redirect devuelve un 301 y te manda al siguiente path
end