#= require ../../base
#= require_tree ./vendors
#= require_tree ./lib
#= require_self

$ ->
  $('.flashes').aaSnakebar()
  $.ripple '.btn, .action_item, .dropdown-item a, .nav-link, .navbar-toggler',
    debug: false
    on: 'mousedown'
    opacity: 0.4
    color: 'auto'
    multi: false
    duration: 0.4
    rate: (pxPerSecond) ->
      pxPerSecond
    easing: 'linear'
