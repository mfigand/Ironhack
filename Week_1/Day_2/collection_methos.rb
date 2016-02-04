require "pry"

class Home
  attr_reader(:name, :city, :capacity, :price)

  def initialize(name, city, capacity, price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end
end

class Collection

 def display_names(name)
    homes.each do |hm|
     puts hm.name
    end
 end

 def sortCapLowHig(homes)
  capacities = homes.map do |hm|
     hm.capacity
   end
   puts capacities.sort
 end

 def sortCapHigLow(homes)
  capacities = homes.map do |hm|
     hm.capacity
   end
   puts capacities.sort.reverse
 end

 def sortPricesLowHig(homes)
  prices = homes.map do |hm|
     hm.price
   end
   puts prices.sort
 end

 def sortPricesHigLow(homes)
  prices = homes.map do |hm|
     hm.price
   end
   puts prices.sort.reverse
 end

 def sameCity(homes)
  puts "Write a city name"
  selectCity = gets.chomp.capitalize
  sameCity = homes.select do |hm|
   hm.city == selectCity
  end
  if sameCity != []
   sameCity.each do |hm|
   puts hm.name + hm.city
   end
   self.averSameCity(sameCity)
  else
    puts "There is no homes in that city"
  end
 end

def averSameCity(sameCity)
  prices = sameCity.map do |hm|
    hm.price
  end
   sumatory = prices.reduce do |sum, price|
     sum + price
   end
   average = sumatory/prices.length
   puts "Average price: #{average}"
end

def enterPrice(homes)
  puts "Write a price"
  selectPrice = gets.chomp.to_i#.to_i convierte el string que recibe en un integer
  samePrice = homes.find do |hm|
   hm.price == selectPrice
  end
  if samePrice != nil
   puts "The first home that costs #{selectPrice} is:"
   puts samePrice.name + samePrice.city
  else
    puts "There is no Home with that price"
  end
end

  def options(homes)
    puts "Choose an option:"
    puts "*************************************************"
    puts "Sort Homes by prices from highest to lowest = 1"
    puts "Sort Homes by prices from lowest to highest = 2"
    puts "Search Homes by city name = 3"
    puts "Search Homes by price = 4"
    puts "exit"
    choose = gets.chomp
    while choose != "exit"  do
      case choose
        when "1"
          self.sortPricesHigLow(homes) 
        when "2"
          self.sortPricesLowHig(homes)
        when "3"
          self.sameCity(homes)
        when "4"
          self.enterPrice(homes)
        else
        options(homes)
      end
     choose = ""
    end
  end

end

homes = [
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "San Juan", 4, 49),
  Home.new("Pepe's place", "Roma", 3, 57),
  Home.new("Paco's place", "Paris", 7, 77),
  Home.new("Luis's place", "NY", 2, 85),
  Home.new("Jose's place", "London", 4, 70),
  Home.new("Juan's place", "Madrid", 5, 65),
]

collection = Collection.new
collection.options(homes)

