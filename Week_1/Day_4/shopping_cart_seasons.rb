require "pry"

class ShoppingCart
  def initialize priceList
    @priceList = priceList
    @unitItems = {}

  end
  def add_items (items)
    @unitItems[items] === nil ? @unitItems[items]=1 : @unitItems[items]+=1  
  end

  def show
    position = 0
    @unitItems.each do |key, value|
      position +=1
      puts "#{position} #{key.to_s} #{value * @priceList[key]}"
    end
  end

  def discount2x1
    modul2x1 = {}
    @unitItems.each do |key, value|
       modul2x1[key] = @unitItems[key] % 2
    end
    apple_to_pay = (@unitItems[:apple]/2) + modul2x1[:apple]
    @unitItems[:apple] = apple_to_pay
  end
  def discount3x2
    modul3x2 = {}
    @unitItems.each do |key, value|
       modul3x2[key] = @unitItems[key] % 3
    end
    orange_to_pay = ((@unitItems[:oranges]-modul3x2[:oranges])*2/3)+modul3x2[:oranges]
    @unitItems[:oranges] = orange_to_pay
  end
  def discount4x1
    modul4x1 = {}
    @unitItems.each do |key, value|
       modul4x1[key] = @unitItems[key] % 4
    end
    if @unitItems[:grapes] >= 4
      puts "For each 4 grapes you get 1 bana for free, if you want them answer YES"
      bananaChoose = gets.chomp.upcase
    #else
    end
    if bananaChoose == "YES"
     freeBananas = ((@unitItems[:grapes]-modul4x1[:grapes])*1/4)
     puts "You get #{freeBananas} banana(s) for free"
     @unitItems[:banana] = @unitItems[:banana]-freeBananas
    #else
    end
  end
  
end  

priceList = {
  apple: 10,
  oranges: 5,
  grapes: 15,
  banana: 20,
  watermelon: 50
}

cart = ShoppingCart.new(priceList)

cart.add_items :apple
cart.add_items :banana
cart.add_items :banana
cart.add_items :grapes
cart.add_items :apple
cart.add_items :apple
cart.add_items :oranges
cart.add_items :oranges
cart.add_items :oranges
cart.add_items :oranges
cart.add_items :oranges
cart.add_items :banana
cart.add_items :banana
cart.add_items :grapes
cart.add_items :grapes
cart.add_items :grapes
cart.add_items :grapes
cart.add_items :watermelon

cart.discount2x1
cart.discount3x2
cart.discount4x1
cart.show





