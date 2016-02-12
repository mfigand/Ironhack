require 'rspec'
require "rack"
require "rack/test"
# require "imdb"
require_relative '../server.rb'

Rspec.describe 'Server Service' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  # it "should load the home page" do
  #   get '/'
  #     expect(last_response).to be_ok
  # end

end


#RSpec.describe "Secure Password" do
  # include Rack::Test::Methods

  # def app
  #   Sinatra::Application
  # end



#   before :each do
#     @movie = Movie.new
#     i = Imdb::Search.new("Funny")
#   end

#   it "should load the home page" do
#     get '/'
#     expect(last_response).to be_ok
#   end


# end

