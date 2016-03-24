# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  # cache the window object
  $window = $(window)
  $('section[data-type="background"]').each ->
    $scroll = $(this)
    $(window).scroll ->
      yPos = -($window.scrollTop() / $scroll.data('speed'))
      coords = '50% ' + yPos + 'px'
      $scroll.css backgroundPosition: coords
