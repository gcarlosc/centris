// This is a manifest file that'll be compiled into application.js, which will include all the files
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
//= require bootstrap
//= require jquery_ujs
//= require select2
//= require jquery.dcjqaccordion.2.7.js
//= require jsacordion.js
//= require jquery.scrollTo.min.js
//= require jquery.nicescroll.js
//= require respond.min.js
//= require slidebars.min.js
//= require common-scripts.js


$(document).on('ready',function(){

    $(document).ready(function(){
      $("select.js-example-basic-single").select2();
    });

    $("#dropdown").select2({
        theme: "bootstrap"
    });

    $('.fa-bars').click(function () {
        if ($('#sidebar > ul').is(":visible") === true) {
            $('#main-content').css({
                'margin-left': '0px'
            });
            $('#sidebar').css({
                'margin-left': '-210px'
            });
            $('#sidebar > ul').hide();
            $("#container").addClass("sidebar-closed");
        } else {
            $('#main-content').css({
                'margin-left': '210px'
            });
            $('#sidebar > ul').show();
            $('#sidebar').css({
                'margin-left': '0'
            });
            $("#container").removeClass("sidebar-closed");
        }
    });

    setTimeout(function(){
        $('#flash').fadeOut("slow");
    }, 2000);

    // $('ola').bind('click',function(){
    //     console.log("hola");
    // });

    // jQuery(function($) {
    //     $('.aldo').click(function(){
    //     var columns = $(".numeros");
    //     var a = $(".nombre").val();
    //     var positions = new Array(parseInt(a));
    //     console.log(parseInt($('.nombre').val()));
  
    //   jQuery.each( positions, function(players) {
    //     var playerNotesContent = document.createElement('div');
    //     playerNotesContent.innerHTML = "<input type='text' class='form-control'>";
    //     playerNotesContent.id = 'player_stats_block'+this;
    //     columns.append(playerNotesContent);
    //     });  
    //   });
    // });
})
