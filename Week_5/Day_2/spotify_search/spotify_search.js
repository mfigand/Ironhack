$(document).on('ready', function(){
  $('.js-search').on('click',function () {
    var artist = $(".input").val();
    var request = $.get('https://api.spotify.com/v1/search?type=artist&query='+artist);
    request.done(handleResponse);
    request.fail(handleError);
  });
});




function handleResponse (response){
  console.log(response);

    $.each(response.artists.items,function(index,val) {
     $('.list_result').append("<li>"+"artist:"+val.name+"</li>");
    });
    // $(".list_result").append("<li>"+"artist:"+response.artists.items[0].name+"</li>");
};

function handleError (error){
  console.log(error);
  $(".error").text("Sorry an error occurred");
}
