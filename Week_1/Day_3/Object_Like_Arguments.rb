
# You could send a  Object like an argument and then the class where you sent it 
# recives all the methods of that object.
# *****************************************************

class Car
    def initialize(sound, engine)
        @noise = sound
        @engine = engine
    end

    def make_noise
        puts @noise + @engine.make_noise
    end
end

class Engine
    def initialize(sound, cilinders)
        @noise = sound
        @cilinders = cilinders
    end

    def make_noise
        @noise
    end
end


motor_chungo = Engine.new("jbjkbkj", "1")
motor_f1 = Engine.new("BBBBBBBBBRRRRRRRRRRRRRRMMMMM", "16")

cuatrolatas = Car.new("ñikiñiki", motor_chungo)
f1alonso = Car.new("zzzzzss", motor_chungo)
maybach = Car.new("zzzzzss", motor_f1)

cuatrolatas.make_noise






















