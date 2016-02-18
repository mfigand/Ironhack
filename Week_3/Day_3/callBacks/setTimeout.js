// function shout () {
//  console.log('It’s been 2 seconds.');
// }
// setTimeout(shout, 2000);

// setTimeout(function () {
//  console.log('It’s been 1 seconds.');
// },1000);


function sleep (time, fn){
  setTimeout(function(){ //setTimeout debe recibir una funcion y no una llamada a una funcion por eso SIEMPRE debe llevar la palabra function y luego la llamada fn()
    fn(time);
  }, time * 1000);
}

console.log("started");

function afterTime(time){
  console.log("It was " + time + " seconds");
}

sleep(1,afterTime)