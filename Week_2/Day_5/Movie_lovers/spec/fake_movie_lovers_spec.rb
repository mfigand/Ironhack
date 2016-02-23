require 'rspec'
require "rack"
require "rack/test"
require "imdb"
require 'pry'
require_relative '../lib/fake_movie_lovers.rb'

RSpec.describe 'test' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  before :each do
      @search = Search.new
      @m1 = FakeImdb.new("Movie 1 Funny", Time.now.strftime("%d/%b/%Y:%H:%M:%S"), "1", "YES")
      @m2 = FakeImdb.new("Movie 2 Funny", Time.now.strftime("%d/%b/%Y:%H:%M"), "2", "YES")
      @m3 = FakeImdb.new("Movie 3 Funny", Time.now.strftime("%d/%b/%Y:%H"), "3", "NO")
      @m4 = FakeImdb.new("Movie 4 Funny", Time.now.strftime("%d/%b/%Y"), "4", "YES")
      @m5 = FakeImdb.new("Movie 5 Funny", Time.now.strftime("%d/%b"), "5", "NO")
      @m6 = FakeImdb.new("Movie 6 Funny", Time.now.strftime("%d"), "6", "YES") 
      @search.add_movie(@m1)
      @search.add_movie(@m2)
      @search.add_movie(@m3)
      @search.add_movie(@m4)
      @search.add_movie(@m5)
      @search.add_movie(@m6)
   end


  it 'should add movies to @imdbArray' do
    @search.add_movie(@m1)
    expect(@search.imdbArray).not_to be(nil)
  end

  it 'should search movies with poster' do
    @movieWithPosterArray = @search.select_num_by_poster("YES")
    expect(@movieWithPosterArray.length).to be(4)
  end

  it 'should select a num of movies' do
    @movieWithPosterArray = @search.select_num_by_poster("YES")
    m = @search.select_num_of_movies(2)
    expect(m.length).to be(2)
  end


end
















