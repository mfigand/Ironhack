var Viking = function(name, health, strength){
  this.name = name;
  this.health = health;
  this.strength = strength;
  this.remainHealt = function(enemy){
   return (this.health - enemy.strength);
  }
}

var Saxon = function(health, strength){
  this.health = health;
  this.strength = strength;
  this.remainHealt = function(enemy){
   return (this.health - enemy.strength);
  }
}

var Pit = function(viking1, viking2, turn){
  this.viking1 = viking1;
  this.viking2 = viking2;
  this.turn = turn;

  this.fight = function(){
    if (viking1.health > viking2.strength && viking2.health > viking1.strength){
      return this.inPit()
    }
    else {
      return console.log("Can´t fight because one will die")
    }
  }
  this.inPit = function() {
   var counter = 0;
   while (viking1.health > viking2.strength && viking2.health > viking1.strength && turn >= counter){
     viking1.remainHealt(viking2);
     counter++;
   }
   if (viking1.health > viking2.health){
     return console.log(viking1.name + " is the winner")
   } else {
   return console.log(viking2.name + " is the winner");
   }
  }
}

var Village = function(vikings,saxons,turn){
  this.vikings = vikings;
  this.saxons = saxons;
  this.turn = turn;

  this.massacre = function(){
    var deathVik = 0;
    var deathSax = 0;
    var counter = 0;
    while (this.turn >= counter){
      var vikRan = vikings[Math.floor(Math.random()*vikings.length)];
      var saxRan = saxons[Math.floor(Math.random()*saxons.length)];
      if (vikRan.remainHealt(saxRan) <= 0){ deathVik++ }
      else if (saxRan.remainHealt(vikRan) <= 0){ deathSax++ }//restar el saxo muerto al array de Saxons use splice()
      counter++;
    }
     console.log("xxx Percentage of Casualties after the massacre xxx ");
     console.log(deathVik/(vikings.length)*100+"%" + " Death Vikings");
     console.log(deathSax/(saxons.length)*100+"%" + " Death Saxons");
  }

}


var maximus = new Viking("Maximus",Math.floor(Math.random() * 100000) + 1,Math.floor(Math.random() * 10) + 1)
var aquiles = new Viking("Aquiles", Math.floor(Math.random() * 100000) + 1,Math.floor(Math.random() * 10) + 1)
var aldebaran = new Viking("Aldebaran", Math.floor(Math.random() * 100000) + 1,Math.floor(Math.random() * 10) + 1)
var poor_saxon1 = new Saxon(Math.floor(Math.random() * 10) + 1,Math.floor(Math.random() * 5) + 1)
var poor_saxon2 = new Saxon(Math.floor(Math.random() * 10) + 1,Math.floor(Math.random() * 5) + 1)
var poor_saxon3 = new Saxon(Math.floor(Math.random() * 10) + 1,Math.floor(Math.random() * 5) + 1)
var poor_saxon4 = new Saxon(Math.floor(Math.random() * 10) + 1,Math.floor(Math.random() * 5) + 1)
var poor_saxon5 = new Saxon(Math.floor(Math.random() * 10) + 1,Math.floor(Math.random() * 5) + 1)
var vikingsArr = [maximus,aquiles,aldebaran]
var saxonsArr = [poor_saxon1,poor_saxon2,poor_saxon3,poor_saxon4,poor_saxon5]
var arena = new Pit (maximus,aquiles, 3)
var village = new Village (vikingsArr,saxonsArr, Math.floor(Math.random() * 8) + 5)

// arena.fight()
village.massacre()
