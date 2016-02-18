// var exampleArray = [2, -5, 10, 5, 4, -10, 0]

// var result = exampleArray.reduce(function(result,x,i){
//   return exampleArray.reduce(function(aux,y,j){
//     return x + y === 0
//     ? aux.concat('(' + i + ',' + j +')')
//     : aux
//   }, result)
//   }, [])

// console.log(result)

// // ---> ['']

// var sample_array = [2, -5, 10, 5, 4, -10, 0 ]
// function process(data){
//    var positions = [];
//    data.forEach (function (a, i) {
//      data.forEach (function (b, j) {
//       if (a + b === 0) {positions.push ( i +","+ j )}
//      });
//    });
//    console.log("You can sum these pairs of numbers and get zero:");
//    console.log(positions);
// }
// process(sample_array);


var numbers = '80:70:90:100';

function averageColon(numbers){

  var splitNum = numbers.split(":");
  var result = splitNum.reduce(function(result,x,i){
   return result + parseInt(x)/splitNum.length
  }, 0)
  return result
}

console.log (averageColon(numbers));
































