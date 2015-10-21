// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require ./plugins/jquery-migrate-1.2.1.min
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require masonry/jquery.masonry
//= require_tree .


$(function() {
   $('.flash').delay(500).fadeIn('normal', function() {
      $(this).delay(2500).fadeOut('slow');
   });
});