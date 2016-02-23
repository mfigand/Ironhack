require 'rspec'
require "rack"
require "rack/test"
require "imdb"
require_relative '../lib/movie_lovers.rb'

RSpec.describe 'test' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  before :each do
     @imdbArray = Imdb::Search.new("Funny").movies
     @search = Search.new(@imdbArray)
   end

  it 'should search movies with poster' do
    @mwpa = @search.select_num_by_poster(nil)
    expect(@mwpa.length).not_to be(0)
  end

  #All the tests were done on the fake_movie_lovers_spec
  #because it took to long doing them with the imdb Gem


end