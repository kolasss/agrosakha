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

  //change select cities collection in profile edit
  $("#profile_region_id").change(function(){
  	// e.preventDefault();
  	var region = $('#profile_region_id').val();
    if(region == "") region="no";
	  $.get("/profiles/update_city_select/" + region, function(data){
	  	$("#profile_city").html(data);
	  } );
	});

	//change select cities collection in sell edit
  $("#sell_region_id").change(function(){
  	// e.preventDefault();
  	var region = $('#sell_region_id').val();
    if(region == "") region="no";
	  $.get("/sells/update_city_select/" + region, function(data){
	  	$("#sell_city").html(data);
	  } );
	});

	//change select cities collection in buy edit
  $("#buy_region_id").change(function(){
  	// e.preventDefault();
  	var region = $('#buy_region_id').val();
    if(region == "") region="no";
	  $.get("/buys/update_city_select/" + region, function(data){
	  	$("#buy_city").html(data);
	  } );
	});

	//change select subcategories collection in sell edit
  $("#sell_category_id").change(function(){
  	// e.preventDefault();
  	var region = $('#sell_category_id').val();
    if(region == "") region="no";
	  $.get("/sells/update_subcat_select/" + region, function(data){
	  	$("#sell_subcategory").html(data);
	  } );
	});

	//change select subcategories collection in buy edit
  $("#buy_category_id").change(function(){
  	// e.preventDefault();
  	var region = $('#buy_category_id').val();
    if(region == "") region="no";
	  $.get("/buys/update_subcat_select/" + region, function(data){
	  	$("#buy_subcategory").html(data);
	  } );
	});

	//change category checkbox in profile edit
	$("input.category_checkbox").change(function() {
		if ($(this).prop("checked") == false) {
			$(this).closest('li.span4').find('input.subcat_checkbox').prop('checked', false);
		}
	});
	$("input.subcat_checkbox").change(function() {
		if ($(this).prop("checked") == true) {
			$(this).closest('li.span4').find('input.category_checkbox').prop('checked', true);
		}
	});
});
