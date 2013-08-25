// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//

//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .
//= require jquery.purr
//= require best_in_place
//= require jquery-minicolors
//= require jquery-minicolors-simple_form

$(function() {
  $(".pagination").on("click", function() {
    $(".pagination").html("Page is loading...");
    $.getScript(this.href);
    return false;
  });
});


          jQuery(document).ready(function($) {

              $('#myCarousel').carousel({
                  interval: 5000
              });

              $('#carousel-text').html($('#slide-content-0').html());

              //Handles the carousel thumbnails
              $('[id^=carousel-selector-]').click( function(){
                  var id_selector = $(this).attr("id");
                  var id = id_selector.substr(id_selector.length -1);
                  var id = parseInt(id);
                  $('#myCarousel').carousel(id);
              });


              // When the carousel slides, auto update the text
              $('#myCarousel').on('slid', function (e) {
                  var id = $('.item.active').data('slide-number');
                  $('#carousel-text').html($('#slide-content-'+id).html());
              });


          });

       $(window).load(function() {
           $('#myCarousel').carousel();

           $(".carousel-nav a").click(function(e){
               e.preventDefault();
               var index = parseInt($(this).attr('data-to'));
               $('#myCarousel').carousel(index);
               var nav = $('.carousel-nav');
               var item = nav.find('a').get(index);
               nav.find('a.active').removeClass('active');
               $(item).addClass('active');
           });

           $("#myCarousel").bind('slide', function(e) {
               var elements = 3; // change to the number of elements in your nav
               var nav = $('.carousel-nav');
               var index = $('#myCarousel').find('.item.active').index();
               index = (index == elements - 1) ? 0 : index + 1;
               var item = nav.find('a').get(index);
               nav.find('a.active').removeClass('active');
               $(item).addClass('active');
           });
       });

       
