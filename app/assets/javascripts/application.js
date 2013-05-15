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
//= require bootstrap-wysihtml5
//= require bootstrap-wysihtml5/locales/ru-RU
//= require_tree .
$(document).ready(function() {
	//WYSIWYG editor
  $('.wysihtml5').each(function(i, elem) {
	  $(elem).wysihtml5({locale: "ru-RU"});
	});

  //change select cities collection in profile
  $("#profile_region_id").change(function(e){
  	e.preventDefault();
  	var region = $('#profile_region_id').val();
    if(region == "") region="0";
	  $.get("/profiles/update_city_select/" + region, function(data){
	  	$("#profile_city").html(data);
	  } );
	});
});
