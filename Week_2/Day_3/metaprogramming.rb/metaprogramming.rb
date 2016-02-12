require 'date'


class String
  def say_yay
    puts "yaaaaaaaaaay"
  end
end

class Object
  def salute
    puts "Hello i am #{say_yay}"
  end
end

# "oh, really?".say_yay

# class Fixnum
#   def +(number)
#     rand * number
#   end
# end

class Dummy
  def method_missing(m, *args, &block)
    puts "There is no method called #{m} here -- please try again"
  end
end

# Dummy.new.buyyaaa

class MagicObject
  def initialize
    @data = {}
  end
  def method_missing(name, *args, &block)
    if args.size > 0
     @data[name] = args.first
    else
     @data[name]
    end
  end
end

# m = MagicObject.new
# m.thing 2
# puts m.thing


def shout method_name
  define_method "shout_#{method_name}".to_sym do |param|
    self.send(method_name.to_sym, param).upcase
  end
end

class A
  shout :hi
  def hi name
    "hi, #{name}!"
  end
end

A.new.shout_hi("Fernando")




















