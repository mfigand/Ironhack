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
        $('.list_artist').append("<li class='li_artist label label-primary' id="+val.id+">"+val.name+"  NO IMAGE ALBUM</li>");
      }
      else {
        $('.list_artist').append(
          "<span id="+val.id+" class='li_artist label label-primary' data-toggle='modal' data-target='#myModal'>"
          +val.name+"</span>"
          +"<img src='"+val.images[0].url+"'/>");
      }
    });
    $('.li_artist').on('click', handleArtistClick );

};

function handleError (error){
  console.log(error);
  $(".error").text("Sorry an error occurred!!");
};

var handleArtistClick = function(event){
  console.log('llego',$(this).prop('id'));
  window.P = $(event.currentTarget)
  var request = $.get('https://api.spotify.com/v1/artists/'+$(this).prop('id')+'/albums');
  request.done(show_albums);
  request.fail(handleError);
}

function show_albums (albums){
  console.log(albums)
  $(".modal-body").empty()
  $.each(albums.items,function(index,val) {
    $(".modal-body").append(
      "<li class='li_album' id="+val.id+" >"
      +val.name
      +"</li>");
    })
    $('.li_album').on('click', handleAlbumClick);
}

var handleAlbumClick = function(event){
  console.log('llego',$(this).prop('id'));
  window.P = $(event.currentTarget)
  var request = $.get('https://api.spotify.com/v1/albums/'+$(this).prop('id'));
  request.done(show_songs);
  request.fail(handleError);
}

function show_songs (songs){
  console.log(songs)
  $(".modal-title").text("Songs");
  $(".modal-body").empty()
  $.each(songs.tracks.items,function(index,val) {
    $(".modal-body").append(
      "<a class='li_songs' id="
      +val.id+" href='"
      +val.preview_url
      +"' target='_blank' >"
      +val.name
      +"</a><br>");
      // debugger
    })
    // $('.li_songs').on('click', handleSongClick);
}
//
// var handleSongClick = function(event){
//   console.log('llego',$(this).prop('id'));
//   window.P = $(event.currentTarget);
//   var request = $.get('https://api.spotify.com/v1/albums/'+$(this).prop('id')+'/tracks');
//   request.done(play_song);
//   request.fail(handleError);
// }
//
// function play_song (songs){
//   console.log(songs)
//   // $(".modal-title").text("Songs");
//   $(".modal-body").empty()
//   $(".modal-body").append(
//
//   )
//     // $(".modal-body").append(
//       // "<audio src="
//       // +songs.tracks.items.preview_url+" id="
//       // +songs.id+" class='song' target='_blank' type='audio/ogg'>"
//       // +"</audio><br>");
//
// }
