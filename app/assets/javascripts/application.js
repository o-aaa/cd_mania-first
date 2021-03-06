// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require activestorage
//= require_tree .

// Bootstrap用
//= require bootstrap-sprockets
//= require jquery3
//= require jquery_ujs
//= require popper
//
// 動的フォームの追加(Gem:nested_form_fields)
//= require nested_form_fields

$(function() {
 $('#buy_count').bind('change', function() {
 	var url = "/cart_create_path(params[:id])/" + $(this).val()
 	if (url) {
 		window.location.replace(url);
 	}
 	return false;
 });
  // button要素をクリックしたら発動
  $('button').click(function() {
 
    // セレクトボックスで選択したvalue値を変数に格納
    var count = $('#buy_count').val();
 
    // p要素にvauleを出力
    $('p').integer(count);
 
  });
});