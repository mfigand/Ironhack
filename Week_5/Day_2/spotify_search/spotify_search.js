$(document).on('ready', function(){
  $('.js-search').on('click',function () {
    $('.list_result').empty();
    var artist = $(".input").val();
    var request = $.get('https://api.spotify.com/v1/search?type=artist&query='+artist);
    request.done(handleResponse);
    request.fail(handleError);
  });
});

function handleResponse (response){
  console.log(response);

    $.each(response.artists.items,function(index,val) {
      if (val.images.length === 0){
        $('.list_artist').append("<li class='li_artist' id="+val.id+">Artist: "+val.name+"  NO IMAGE ALBUM</li>");
      }
      else {
        $('.list_artist').append(
          "<li class='li_artist' id="+val.id+" >"+"artist: "+val.name+"</li>"
          +"<img src='"+val.images[0].url+"'/>"

        );


      }
    });
    $('.li_artist').on('click', handleClick );

};

function handleError (error){
  console.log(error);
  $(".error").text("Sorry an error occurred!!");
};

var handleClick = function(event){
  console.log('llego',$(this).prop('id'));
  window.P = $(event.currentTarget)
  var request = $.get('https://api.spotify.com/v1/artists/'+$(this).prop('id')+'/albums');
  request.done(show_albums);
  request.fail(handleError);
}

function show_albums (albums){
  console.log(albums)
  $.each(albums.items,function(index,val) {
    $(".list_album").append(
      "<li class='li_album' id="+val.id+" >"
      +"Album: "+val.name
      +"</li>");
    })
}
