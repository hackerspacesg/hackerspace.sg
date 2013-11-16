jQuery.ajax({
  url: 'http://cam.hackerspace.sg/lastfetched.txt'
  , success: function(data){
    jQuery('.livecam').append(jQuery('<img/>').attr({
      src: 'http://cam.hackerspace.sg/' + data
      , title: new Date(parseInt(data.match(/[0-9]+/g)[0])*1000)
    }).width(390).height(285));
  }
});

