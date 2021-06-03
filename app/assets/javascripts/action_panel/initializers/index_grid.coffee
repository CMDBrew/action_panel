onDOMReady = ->
  $('.index_grid :checkbox').change ->
    if @checked
      $(@).parents('.grid-item').addClass('selected')
    else
      $(@).parents('.grid-item').removeClass('selected')

$(document).
  ready(onDOMReady).
  on 'page:load turbolinks:load', onDOMReady
