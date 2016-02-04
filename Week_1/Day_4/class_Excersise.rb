# require "pry"

# class User
#   def initialize(checkPassword)
#      @checkPassword = checkPassword
#      @text = ""
#    end
#    def check(insertPassword)
#     if insertPassword == @checkPassword
#       puts "Enter a Text"
#       @text = gets.chomp
#       countWord
#     else
#       puts "Incorrect password"
#     end
#    end

#   def countWord
#     arrayText = @text.split
#     puts "Number of words: #{arrayText.length}"

#   end
# end


# login = User.new("123456")
# puts "Write your password"
# insertPassword = gets.chomp

# login.check(insertPassword)

require "pry"

class User
  attr_reader :checkPassword
  def initialize(checkPassword)
     @checkPassword = checkPassword
   end
end

class Autenticator
   def check(insertPassword, user)
    if insertPassword == user.checkPassword
      puts "Enter a Text"
      @text = gets.chomp
      countWord
    else
      puts "Incorrect password"
      #user.check(insertPassword)
    end
   end

  def countWord
    arrayText = @text.split
    puts "Number of words: #{arrayText.length}"
  end
end

login = User.new("123456")
puts "Write your password"
insertPassword = gets.chomp

Autenticator.new.check(insertPassword, login)






