var Viking = function(name, health, strength){
  this.name = name;
  this.health = health;
  this.strength = strength;
  this.attack = function(enemy){
   return (this.health - enemy.strength);
  }
}

var Pit = function(){

  this.fight = function(viking1, viking2, turn){
    if (viking1.health > viking2.strength && viking2.health > viking1.strength){
      return this.inPit(viking1, viking2, turn)
    }
    else {
      return console.log("Can´t fight because one will die")
    }
  }
  this.inPit = function(viking1, viking2, turn) {
   var counter = 0;
   while (viking1.health > viking2.strength && viking2.health > viking1.strength && turn >= counter){
     viking1.attack(viking2);
     counter++;
   }
   if (viking1.health > viking2.health){
     return console.log(viking1.name + " is the winner")
   } else {
   return console.log(viking2.name + " is the winner");
   }
  }
}

var pit = new Pit ()
var maximus = new Viking("Maximus",Math.floor(Math.random() * 10000) + 1,Math.floor(Math.random() * 10) + 1)
var aquiles = new Viking("Aquiles", Math.floor(Math.random() * 100000) + 1,Math.floor(Math.random() * 10) + 1)

pit.fight(maximus,aquiles, 3)
