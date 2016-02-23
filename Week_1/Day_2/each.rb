#names = ["Javier", "shed", "Adrián"]

#names.each {|item| puts "#{names}, Good Mornig"}


array = ["new york", "roma", "madrid"]

#array.reduce do { |longest, city| if longest.length > city.length }

#result = 
array.reduce { |long, city| long.length < city.length ? city : long }

#puts result
  