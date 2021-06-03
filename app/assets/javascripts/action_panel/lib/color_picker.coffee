class ActionPanel.ColorPicker

  constructor: (@options, @element) ->
    @$element = $(@element)

    defaults = {
      'theme': 'bootstrap'
      'letterCase': 'uppercase'
    }

    @options = $.extend defaults, @options
    @_bind()

  destroy: ->
    @$element.minicolors('destroy')

  _bind: ->
    @configs = @$element.data('minicolors') || {}
    @options = $.extend @options, @configs

    @$element.minicolors(@options)
    @

$.widget.bridge 'aaColorPicker', ActionPanel.ColorPicker
