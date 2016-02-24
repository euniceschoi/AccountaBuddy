

$(function(){ $(document).foundation(); });

$('.curtains').curtain();
$(function () {
    $('.curtains').curtain({
        scrollSpeed: 400
    });
});
$(function () {
    $.scrollUp();
});

$(document).ready(function(){
  sendMessageListener();
  geoLocatorListener();
  recommendationHandler();
  recommendationSubmit();
  loginListener();

});



var sendMessageListener = function() {
  $('body').on('submit', '#send-messages', function(event){
    event.preventDefault();
    var messageData = $(this).children().serialize();
    var request = $.ajax({
      url: '/messages',
      method: 'POST',
      data: messageData
    });
    request.done(function(response){
      $(response).appendTo('#messages');
      $("#message-input-box").val("");
    });
    request.fail(function(response){
    })
  })
}

var geoLocatorListener = function() {
  $("#geolocate").on('click', function(event){
   var map = L.mapbox.map('map', 'mapbox.streets');
    event.preventDefault();
    event.stopPropagation();

    var locate = map.locate();
    var myLayer = L.mapbox.featureLayer().addTo(map);

    map.on('locationfound', function(event){
        var latitude = event.latlng.lat
        var longitude = event.latlng.lng
          map.fitBounds(event.bounds);
          myLayer.setGeoJSON({
            type: 'Feature',
              geometry: {
              type: 'Point',
              coordinates: [event.latlng.lng, event.latlng.lat]
          },
          properties: {
              'title': 'Here I am!',
              'marker-color': '#ff8888',
              'marker-symbol': 'star'
          }
        })

        $('#map').css('display', 'none')
        $("#latitude-fill input").val(latitude)
        $("#longitude-fill input").val(longitude)
        $("#geolocate").hide();
    });
  })
}

var recommendationHandler= function(){
  $('#user-show-praise-container').on('click', '#recommendation-link', function(event){
    event.preventDefault();
    $(this).hide();
    $("#recommendation-box").fadeIn();
  })
}

var recommendationSubmit = function() {
   $('#user-show-praise').on('submit', '#recommendation-box', function(event){

      event.preventDefault();

      var recommendationData = $(this).children().serialize();
      var request = $.ajax({
        url: '/recommendations',
        data: recommendationData,
        method: 'POST'
      })
      request.done(function(response){
        $("#recommendation-append").append(response)
        $("#recommendation-box #recommendation_body").val("")
        $("#recommendation-box").fadeOut();
        $("#recommendation-link").fadeIn();
      })
      request.fail(function(error){
      })
    })
}

var loginListener = function (){
  $('.curtains').on('click', '#login-link', function(event){
    event.preventDefault();
    $("#splash-box-1").delay(100).fadeIn();
  })
}

var endorseHandler = function (){
  $('#user-badges').on('click','.endorse-link',function(event){
    event.preventDefault();

    var urlPath = $(this).attr('href')

    var request = $.ajax({
      url: urlPath,
      method: 'put',
      dataType: 'json'
    })
    request.done(function(response){
    })
    request.fail(function(error){
      console.log(error);
    })
  })
}
