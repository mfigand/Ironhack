class Dog #Debe de empezar con mayusculas
	def initialize (name,breed)#debe iniciar con miniscula
		@name = name
		@breed = breed
		@logFile = "#{@name}_people_smell.log"
		file = File.open(@logFile, "w")#w reescribe el fichero cada que corre el programa 
		file.puts(nil)
		file.close 
	end
	def bark (bark)
		puts bark
	end
	def name=(str)#set name, setter: sobre escribe el valor de la variable que hace referencia
		@name = str
	end
	def name#Get name
		@name
	end
	def smell (person)
		file = File.open(@logFile, "a")
		file.puts(person)
		file.close 
	end
	def people_smell
		file = File.open(@logFile, "r")
		people = file.readlines#readlines va al fichero y cada entrada la convierte en un cambio de linea y lo presenta como array
		file.close 
		people
	end
end

class PetDog < Dog
	def initialize (name,breed,owner)
		super(name,breed)#Coje los argumentos de la clase padre y añade los argumentos individuales de esta clase
		                 #Super llama los argumentos de su propio initialize y por POSICION entiende que son los primeros
		                 #dos argumentos de la clase padre
		@owner = owner
	end
	def fetch 
		puts "bring the ball"
	end
end


toby = Dog.new "Toby","Lab"
toby.name=("Joe")
#puts toby.name

toby.smell("Pepe")
toby.smell("Paco")
toby.smell("Luis")

toby.people_smell





