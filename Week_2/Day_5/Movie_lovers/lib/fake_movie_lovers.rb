require "imdb"
require 'pry'

class Search
   attr_reader :imdbArray
   def initialize
    @imdbArray = []
   end

   def add_movie (movie)
    @imdbArray << movie
  end

  def select_num_by_poster(signboard)
    @movieWithPosterArray = @imdbArray.select { |m| m.poster != signboard }
  end

  def select_num_of_movies(num)
    @movieWithPosterArray.sample(num)
  end

  def selector
    select_num_by_poster(nil)
    select_num_of_movies(9)
  end

 end


class FakeImdb
  attr_reader :title, :year, :id, :poster
  def initialize (title, year, id, poster)
    @title = title
    @year = year
    @id = id
    @poster = poster
  end
end

search = Search.new

m1 = FakeImdb.new("Movie 1 Funny", Time.now.strftime("%d/%b/%Y:%H:%M:%S"), "1", "YES")
m2 = FakeImdb.new("Movie 2 Funny", Time.now.strftime("%d/%b/%Y:%H:%M"), "2", "YES")
m3 = FakeImdb.new("Movie 3 Funny", Time.now.strftime("%d/%b/%Y:%H"), "3", nil)
m4 = FakeImdb.new("Movie 4 Funny", Time.now.strftime("%d/%b/%Y"), "4", "YES")
m5 = FakeImdb.new("Movie 5 Funny", Time.now.strftime("%d/%b"), "5", nil)
m6 = FakeImdb.new("Movie 6 Funny", Time.now.strftime("%d"), "6", "YES") 
m7 = FakeImdb.new("Movie 7 Funny", Time.now.strftime("%d/%b/%Y:%H:%M:%S"), "1", "YES")
m8 = FakeImdb.new("Movie 8 Funny", Time.now.strftime("%d/%b/%Y:%H:%M"), "2", "YES")
m9 = FakeImdb.new("Movie 9 Funny", Time.now.strftime("%d/%b/%Y:%H"), "3", nil)
m10 = FakeImdb.new("Movie 10 Funny", Time.now.strftime("%d/%b"), "5", nil)
m11 = FakeImdb.new("Movie 11 Funny", Time.now.strftime("%d"), "6", "YES") 
m12 = FakeImdb.new("Movie 12 Funny", Time.now.strftime("%d/%b/%Y:%H:%M:%S"), "1", "YES")
m11 = FakeImdb.new("Movie 11 Funny", Time.now.strftime("%d"), "6", "YES") 
m12 = FakeImdb.new("Movie 12 Funny", Time.now.strftime("%d/%b/%Y:%H:%M:%S"), "1", "YES")

search.add_movie(m1)
search.add_movie(m2)
search.add_movie(m3)
search.add_movie(m4)
search.add_movie(m5)
search.add_movie(m6)
search.add_movie(m7)
search.add_movie(m8)
search.add_movie(m9)
search.add_movie(m10)
search.add_movie(m11)
search.add_movie(m12)

search.selector

