class ActionPanel.InputFormatter

  constructor: (@options, @element) ->
    @element  = @element
    @$element = $(@element)
    defaults  = {}

    @options = $.extend defaults, @options
    @_bind()

  _bind: ->
    @configs = @$element.data('format-options') || {}
    @options = $.extend @options, @configs

    new Cleave(@element, @options)
    @

$.widget.bridge 'aaInputFormatter', ActionPanel.InputFormatter
