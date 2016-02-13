require 'rspec'
require "rack"
require "rack/test"
require "imdb"
require_relative '../server.rb'

RSpec.describe 'test' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'should load the home page' do
    get '/'
    expect(last_response).to be_ok
  end

  it 'should search movies with imbd' do
    get 'search'
    expect(last_response).to be_ok
  end


end