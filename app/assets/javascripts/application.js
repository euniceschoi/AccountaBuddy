
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
//= require turbolinks
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
  userSubmitListener();
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

var userSubmitListener = function() {
  $('body').on('submit', '#user-signedit-form', function(event){
    event.preventDefault();
    var userFormData = $(this).children().serialize();
    $(".user-signedit-container").hide();
    debugger

    $("#map").css('display', 'block');
    $("#geolocate").css('display', 'block')
    //click find me
    //create a variable and grab the coordinates from the find me button
    //make the ajax request to the post route for users
    //two sets of data in a object



  })

}

