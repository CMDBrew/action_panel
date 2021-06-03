class ActionPanel.FileInput

  constructor: (@options, @element) ->
    @$element = $(@element)
    @$input   = @$element.find('input')
    @$label   = @$element.find('.custom-file-label')

    defaults = {}
    @options = $.extend defaults, @options

    @_bind()

  readUrl: (input)->
    target = @$element.find('.custom-file-preview')
    target.empty()
    if input.files[0].type.includes('image')
      reader = new FileReader

      reader.onload = (e) ->
        image =  "<img src='#{e.target.result}'/>"
        target.html image

      reader.readAsDataURL input.files[0]
    @

  update: (e)->
    input = e.target
    if input.files and input.files[0]
      @$label.text input.files[0].name
      @readUrl(e.target)

  # Private
  _bind: ->
    @$input.on 'change', (e)=>
      @update(e)
      false

$.widget.bridge 'aaFileInput', ActionPanel.FileInput
