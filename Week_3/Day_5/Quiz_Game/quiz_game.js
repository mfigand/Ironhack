var read = require('read');

var Question = function(text, answer, id){
  this.text = text;
  this.answer = answer.toLowerCase();
  this.id = id;
  this.analize = function(userAnswer){
    if (this.answer === userAnswer){console.log("Correct!!");
    } else {console.log("Incorrect") ;}
  };

}

// var Quiz = function(){
//   userAnswer,question
//
// }

var quest1 = new Question("Worldcup champion 1930?\n>", "uruguay", 1)
var quest2 = new Question("Worldcup country 1986?\n>", "mexico", 2)
var quest3 = new Question("Worldcup champion 1954?\n>", "alemania federal", 3)
// var quiz = new Quiz()

options = {
    prompt: "You have 10 seconds to answer\n>"+quest1.text,
    timeout: 10000
}

read(options, startGame)

function startGame (err, userAnswer){
    // console.log("Your name is: " + name)
    quest1.analize(userAnswer)

}
