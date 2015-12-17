
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
// require turbolinks
//= require_tree .

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
  // endorseHandler(); 

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
      console.log("YES!")
      console.log(response)
    });
    request.fail(function(response){
      console.log('shit')
      console.log(response)
    })
  })
}

var geoLocatorListener = function() {
   // $("#map").css('display', 'none');
    // $("#map").css('display', 'block');
  $("#geolocate").on('click', function(event){
   var map = L.mapbox.map('map', 'mapbox.streets');
    //var map = L.mapbox.map('map', 'mapbox.streets'); (merge conflict - if map issue, perhaps uncomment this)
    event.preventDefault();
    event.stopPropagation();
    
    var locate = map.locate();
    var myLayer = L.mapbox.featureLayer().addTo(map);
    console.log("IT WORKED!")
    
    map.on('locationfound', function(event){
        console.log(event);
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
      console.log(recommendationData)
      var request = $.ajax({
        url: '/recommendations',
        data: recommendationData,
        method: 'POST'
      })
      request.done(function(response){
        console.log(response);
        console.log("FUCK YEAHHHHHHH");
        
        $("#recommendations").append(response)
        $("#recommendation-box #recommendation_body").val("")
        $("#recommendation-box").fadeOut();
        $("#recommendation-link").fadeIn();
      })
      request.fail(function(error){
        console.log(error)
      })
    })
}

var loginListener = function (){
  $('.curtains').on('click', '#login-link', function(event){
    event.preventDefault();
    console.log("prevent!")
    $("#splash-box-1").delay(100).fadeIn();
  })
}

var endorseHandler = function (){
  $('#user-badges').on('click','.endorse-link',function(event){
    event.preventDefault();
    console.log("prevent! ")
   

    var urlPath = $(this).attr('href')

    var request = $.ajax({
      url: urlPath,
      method: 'put',
      dataType: 'json'
    })
    request.done(function(response){
      console.log(response)
      console.log("yes you made it!!");
      
    })
    request.fail(function(error){
      console.log(error);
      console.log("awwwman")
    })
  })
}
// var userSubmitListener = function() {
//   $('body').on('submit', '#user-signedit-form', function(event){
//     event.preventDefault();
//     var userFormData = $(this).children().serialize();
//     $(".user-signedit-box").hide();


//     $("#map").css('display', 'block');
//     $("#geolocate").css('display', 'block')
//     $("#geolocate").on('click', function(event){
//       event.preventDefault();
//       event.stopPropagation();
      // var map = L.mapbox.map('map', 'mapbox.streets');
      // var locate = map.locate();
      // var myLayer = L.mapbox.featureLayer().addTo(map);

//       console.log(event)
//       console.log(locate)
//       map.on('locationfound', function(event){
//         map.fitBounds(event.bounds);
//         myLayer.setGeoJSON({
//           type: 'Feature',
//             geometry: {
//             type: 'Point',
//             coordinates: [event.latlng.lng, event.latlng.lat]
//         },
//         properties: {
//             'title': 'Here I am!',
//             'marker-color': '#ff8888',
//             'marker-symbol': 'star'
//         }
//     });
//     // And hide the geolocation button
//     $("#geolocate").hide();
//     var userCoordinates = {longitude: event.latlng.lng, latitude: event.latlng.lat}

//     // var request = $.ajax({
//     //   url: '/users',
//     //   type: "POST",
//     //   data: userFormData + "&longitude=" + event.latlng.lng + "&latitude=" + event.latlng.lat,
//     //   dataType: 'JSON'
//     // })
//     // request.done(function(response){
//     //   console.log(response);
//     //   console.log("NICE!");
//     // });
//     // request.fail(function(response){
//     //   console.log(response)
//     //   console.log("shit")
//     // })



//       })
//     })
//     //click find me
//     //create a variable and grab the coordinates from the find me button
//     //make the ajax request to the post route for users
//     //two sets of data in a object



//   })

// }

