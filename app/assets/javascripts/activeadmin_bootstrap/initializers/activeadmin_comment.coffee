onDOMReady = ->
  $('#active_admin_comment_body_input trix-editor').on 'trix-file-accept', (e)->
    false

$(document).
  ready(onDOMReady).
  on 'page:load turbolinks:load', onDOMReady
