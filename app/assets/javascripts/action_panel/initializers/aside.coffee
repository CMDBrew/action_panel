onDOMReady = ->
  $('#aside-filters').on 'show.bs.collapse', ->
    $('body').addClass 'aside-active'

  $('#aside-filters').on 'hide.bs.collapse', ->
    $('body').removeClass 'aside-active'

$(document).
  ready(onDOMReady).
  on 'page:load turbolinks:load', onDOMReady
