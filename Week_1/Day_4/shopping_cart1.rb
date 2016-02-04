require "pry"

class ShoppingCart

  def initialize priceList
    @priceList = priceList
    @base_price = 0
    @items = []
  end
  def add_items (item)
    @items.push(item)
  end
  def cost
    appleTotal = 0
    orangesTotal = 0
    grapesTotal = 0
    bananaTotal = 0
    watermelonTotal = 0
    for i in @items
      if i == :apple 
       appleTotal += @priceList[i] 
      elsif i == :oranges
       orangesTotal += @priceList[i]
      elsif i == :grapes
       grapesTotal += @priceList[i]
      elsif i == :banana
       bananaTotal += @priceList[i]
      elsif i == :watermelon
       watermelonTotal += @priceList[i]
      end
    end
    puts @costTotal = appleTotal + orangesTotal + grapesTotal + bananaTotal + watermelonTotal
  end
  #   if @items.length > 5
  #     checkout = checkout * 0.90
  #   end
  #   puts "Your Total today is $#{checkout} Have a nice day"
  # end
  def show
    puts 
    #puts "#{@items[0].name}: #{@items[0].price}$"
    #binding.pry
  end
end

# class Item
#   attr_reader :name, :price
#   def initialize (name, price)
#     @name = name
#     @price = price
#   end
# end



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

cart.cost
cart.show




