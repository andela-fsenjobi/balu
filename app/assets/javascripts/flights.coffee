$(document).ready ->
  # cache the window object
  $window = $(window)
  $('section[data-type="background"]').each ->
    $scroll = $(this)
    $(window).scroll ->
      yPos = -($window.scrollTop() / $scroll.data('speed'))
      coords = '50% ' + yPos + 'px'
      $scroll.css backgroundPosition: coords

  $ ->
    $('.tooltip').tooltip()

  $('.date-picker').datepicker()
  $('.date-picker').on 'change', ->
    id = $(this).attr('id')
    val = $('label[for=\'' + id + '\']').text()
    $('#msg').text val + ' changed'
