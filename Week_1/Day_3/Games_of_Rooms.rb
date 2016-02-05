require 'pry'

class Game
  def initialize(roomArray)
    @roomArray = roomArray
  end

  def place1(choose, position)
    if position == "0" && choose.upcase == "E"
      place = "2"
      puts @roomArray[2].description
      newChoose = gets.chomp
      place3(newChoose,place)
    elsif position == "0" && choose.upcase == "EXIT"
    else
      puts "Aun es pronto, entra y disfruta de la fiesta"
      puts @roomArray[0].description
      place1(gets.chomp,"0")
    end
  end
  def place2(choose, position)
    if position == "1" && choose.upcase == "B"
      place = "4"
      puts @roomArray[4].description
      newChoose = gets.chomp
      place5(newChoose,place)
    elsif position == "1" && choose.upcase == "C"
      place = "2"
      puts @roomArray[2].description
      newChoose = gets.chomp
      place3(newChoose,place)
    elsif position == "1" && choose.upcase == "EXIT"
      else
      puts "Se que es una dificl decision pero debes elegir, yo recomiendo la birra"
      puts @roomArray[1].description
      place2(gets.chomp,"1")
    end
  end
  def place3(choose, position)
    if position == "2" && choose.upcase == "D"
      place = "3"
      puts @roomArray[3].description
      newChoose = gets.chomp
      place4(newChoose,place)
    elsif position == "2" && choose.upcase == "B"
      place = "1"
      puts @roomArray[1].description
      newChoose = gets.chomp
      place2(newChoose,place)
    elsif position == "2" && choose.upcase == "S"
      place = "0"
      puts @roomArray[0].description
      newChoose = gets.chomp
      place1(newChoose,place)
    elsif position == "2" && choose.upcase == "EXIT"
      else
      puts "Esa no es una opcion, vete por una birra mientras lo piensas"
      puts @roomArray[2].description
      place3(gets.chomp,"2")
    end
  end
  def place4(choose, position)
    if position == "3" && choose.upcase == "C"
      place = "2"
      puts @roomArray[2].description
      newChoose = gets.chomp
      place3(newChoose,place)
    elsif position == "3" && choose.upcase == "A"
      place = "5"
      puts @roomArray[5].description
      newChoose = gets.chomp
      place6(newChoose,place)
    elsif position == "3" && choose.upcase == "EXIT"
      else
      puts "Ese sitio no es una opción, te recomiendo ir al aseo y puedas beber más birras"
      puts @roomArray[3].description
      place4(gets.chomp,"3")
    end
  end
  def place5(choose, position)
    if position == "4" && choose.upcase == "V"
      place = "1"
      puts @roomArray[1].description
      newChoose = gets.chomp
      place2(newChoose,place)
    elsif position == "4" && choose.upcase == "EXIT"
      else
      puts "No, innoves. Lo mejor es ir a la barra por mas birra"
      puts @roomArray[4].description
      place5(gets.chomp,"4")
    end
  end
  def place6(choose, position)
    if position == "5" && choose.upcase == "D"
      place = "3"
      puts @roomArray[3].description
      newChoose = gets.chomp
      place4(newChoose,place)
    elsif position == "5" && choose.upcase == "EXIT"
      else
      puts "Ya has vaciado el tanque, cruza por la sala de DJ y ve por mas birras"
      puts @roomArray[5].description
      place6(gets.chomp,"5")
    end
  end

end

class Room
  attr_reader :doors, :description 
  def initialize( doors, description)
    @doors = doors
    @description = description
  end
end

roomArray = [
  room1 = Room.new(["E"], "Estas en la puerta del BAR, escribe E para entrar"),
  room2 = Room.new(["B","C"], "Estas junto a la barra, escribe B para pedir una birra o C para ir al concierto"),
  room3 = Room.new(["D","B","S"], "Estas junto al escenario, escribe D para ir a la sala de DJ, B para ir a la Barra o S para salir del Bar"),
  room4 = Room.new(["C","A"], "Estas en la sala del Dj, escrib C para ir al concierto o A para ir al aseo"),
  room5 = Room.new(["V"], "Te has terminado tu birra, escribe V vuelve a la barra y pide otra"),
  room6 = Room.new(["D"], "Estas en el aseo, escribe D para volver a la sala del DJ")
]
game = Game.new(roomArray)

puts room1.description
choose = gets.chomp

game.place1(choose,"0")



















