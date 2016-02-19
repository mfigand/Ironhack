var read = require('read');

var Question = function(text, answer, id){
  this.text = text;
  this.answer = answer.toLowerCase();
  this.id = id;
  this.analize = function(userAnswer){
    if (this.answer === userAnswer){
      console.log("Correct!!");
      quiz.nextQuestion(this.id)
    } else {
      console.log("Incorrect");
      quiz.repetQuestion(this.id)
    }
  };

}

var Quiz = function(questArray){
  this.nextQuestion = function(id){
    read(options2, startGame)
  }
  this.repetQuestion = function(id){
    read(options1, startGame)
  }

}

var quest1 = new Question("Worldcup champion 1930?\n>", "uruguay", 1)
var quest2 = new Question("Worldcup country 1986?\n>", "mexico", 2)
var quest3 = new Question("Worldcup champion 1954?\n>", "alemania federal", 3)
var questArray = [quest1,quest2,quest3];
var correctAnswerArray = [];
var quiz = new Quiz(questArray)
var actualQuestion = questArray[Math.floor(Math.random()*questArray.length)]
var actualId = actualQuestion.id;

function checkQuest(id) {
  for (i=0; i<correctAnswerArray.length; i++){
      if (correctAnswerArray[i] != id){
      correctAnswerArray.push(id);
      questArray.splice(i,1)
      }
  }
 if (questArray.length === 0){
   return console.log("You Win");
 }
 else {
   return actualQuestion = questArray[Math.floor(Math.random()*questArray.length)]
 }
}

options1 = {
    prompt: "You have 10 seconds to answer\n>"+checkQuest(1).text,
    timeout: 10000
}

options2 = {
    prompt: "Again you have 10 seconds to answer\n>"+checkQuest(actualId).text,
    timeout: 10000
}

read(options1, startGame)

function startGame (err, userAnswer){
    // console.log("Your name is: " + name)
    actualQuestion.analize(userAnswer)
}
