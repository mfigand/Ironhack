
pokemon = Math.floor((Math.random() * 50) + 0)
var request = $.get('http://pokeapi.co/api/v2/pokemon/'+pokemon);
request.done(handleResponse);
request.fail(handleError);

function handleResponse (response){
  $(".pokemon_name").text(response.name);
  $('.js-pokemon').on('click', function(){
    $(".abilities").append("<li>"+"height:"+response.height+"</li>");

    $.each(response, function( index, value ) {
      // if (value.type === "string"){
        $(".abilities").append("<li>"+index+value+"</li>");
      // };
    });

  })
};

function handleError (error){
  $(".error").text("Sorry an error occurred");
}
