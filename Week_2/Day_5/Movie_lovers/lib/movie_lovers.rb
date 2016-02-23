require "imdb"
require 'pry'

class Search
  attr_reader :imdbArray
   def initialize(searchWord)
    @imdbArray = Imdb::Search.new(searchWord).movies
   end

  def select_num_by_poster(signboard)
    @movieWithPosterArray = @imdbArray.select { |m| m.poster != signboard }
  end

  def select_num_of_movies(num)
    @movieWithPosterArray.sample(num)
  end

  def selector
    if @imdbArray.length >= 2
        select_num_by_poster(nil)
        select_num_of_movies(9)
    elsif @imdbArray[0] == nil
      "No movies found"
    else
      "No movies found"
    end
  end



end





