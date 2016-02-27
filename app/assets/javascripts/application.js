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
//= require jquery_ujs
//= require select2
//= require jquery-migrate-1.2.1.min.js
//= require bootstrap
//= require jsacordion.js
//= require jquery.scrollTo.min.js
//= require jquery.nicescroll.js
//= require jquery.dataTables.js
//= require DT_bootstrap.js
//= require respond.min.js
//= require slidebars.min.js
//= require common-scripts.js
//= require editable-table.js


$(document).on('ready',function(){
	$(".provider-list").click(function(){
        $(".show-provider-list").toggle();
    });

    $(document).ready(function(){ 
    	$("select.js-example-basic-single").select2();
    });

    $("#dropdown").select2({
        theme: "bootstrap"
    });

    jQuery(document).ready(function() {
        EditableTable.init();
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

    $('li.active').click(function(){
        $('link').addClass('active');
    });

})
