$(document).on('ready', function(){
  var color = localStorage.getItem("Color",color);
  $("body").css('background-color',color);
  console.log(color);
});
var $color_button = $('.color-changer');

function changeColor(event){
  var color = $(event.target).data('color');
  $("body").css('background-color',color);
  localStorage.setItem("Color",color)
  console.log(color);
}

$color_button.on("click",changeColor);
