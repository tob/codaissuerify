// Submit new song
function submitNewSong(event) {
  event.preventDefault();

  var title = $("#new-song").val();

  createNewSong(title);

  $("#new-song").val(null);
}

function createNewSong(title) {
  var songId = "song-" + nextNewSongId();
  var artistUrl = window.location.pathname;
  var artistId = artistUrl.substring(artistUrl.lastIndexOf('/') + 1);

  var newSong = {name: title, length: 12}

  $.ajax({
    type: "POST",
    url: "/artists/"+artistId+"/api/songs.json",
    data: JSON.stringify({
      song: newSong
    }),
    contentType: "application/json",
    dataType: "json"
  }).done(function(data) {
    console.log(data);

      var listItem = $("<li></li>");
      listItem.addClass("list-group-item song");
      listItem.attr('id', songId);

      var space = document.createTextNode(' ');

      var badge = $('<span></span>');
      badge.addClass("badge");

      var delete_link = $('<a></a>');
      delete_link.attr('href','');
      delete_link.addClass("clean-this");

      var trash = $('<span></span>');
      trash.addClass("glyphicon glyphicon-trash danger");
      trash.attr('aria-hidden', true);

      listItem.append(title);
      listItem.append(space);
      listItem.append(badge);
      badge.append(delete_link);
      delete_link.append(trash);
      delete_link.append(" Clean this");

      $("#all-songs").append( listItem );
    }).fail(function(error) {
    console.log(error)
    error_message = error.responseJSON.title[0];
    showError(error_message);
  });
}


function nextNewSongId() {
  return $(".song").length + 1;
}

// removing songs by class or by markup position
function cleanUpSongs(event) {
  event.preventDefault();
  $(".song").remove();
}

function cleanThis(event) {
  event.preventDefault();
  $(this).parent().parent().remove();
}

// Tiding all the functions to buttons and links
$(document).ready(function(){
  $("form").bind('submit', submitNewSong);
  $(".clean-this").bind('click', cleanThis);
  $("#clean-up").bind('click', cleanUpSongs);
});
