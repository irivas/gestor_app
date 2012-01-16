// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$(function() {
	$("#usuarios .pagination a").live("click", function() {
		$.getScript(this.href);
		return false;
	});
	$("#usuarios_search input").keyup(function() {
		$.get($("#usuarios_search").action, $("#usuarios_search").serialize(), null, "script");
		return false;
	});
	$("#competencias .pagination a").live("click", function() {
		$.getScript(this.href);
		return false;
	});
	$("#competencias_search input").keyup(function() {
		$.get($("#competencias_search").action, $("#competencias_search").serialize(), null, "script");
		return false;
	});
	$("#cargos .pagination a").live("click", function() {
		$.getScript(this.href);
		return false;
	});
	$("#cargos_search input").keyup(function() {
		$.get($("#cargos_search").action, $("#cargos_search").serialize(), null, "script");
		return false;
	});
	$("#organizaciones .pagination a").live("click", function() {
		$.getScript(this.href);
		return false;
	});
	$("#organizaciones_search input").keyup(function() {
		$.get($("#organizaciones_search").action, $("#organizaciones_search").serialize(), null, "script");
		return false;
	});
});