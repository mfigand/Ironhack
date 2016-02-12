require "sinatra"
require "sinatra/reloader" if development?
require "artii"
enable(:sessions)

# get "ascii/one_random_word" do

# end

get "/ascii/:insert" do#convert the word to ASCII and then print it out
  insert = params[:insert]
  @a = Artii::Base.new :font => 'slant'
  @word = @a.asciify(insert)
  erb(:word)
end











