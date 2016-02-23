var Car = function(model, noise, wheels){
  this.model = model;
  this.noise = noise;
  this.wheels = 4;
  this.printWheels = function(){
    console.log(this.wheels)
  }
}

 Car.prototype.makeNoise = function(){
  console.log(this.noise + "!!!!!")
 }

var bmw = new Car("BMW", "Grrrr")
var vw = new Car("VW", "brrrrr")

bmw.makeNoise()
vw.makeNoise()

console.log(Object.keys(bmw))
