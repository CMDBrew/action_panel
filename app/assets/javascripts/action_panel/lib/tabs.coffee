class ActionPanel.Tabs

  constructor: (@options, @element) ->
    @$element = $(@element)

    defaults = {
      excludeClass: 'http-tabs'
    }

    @options = $.extend defaults, @options

    @_bind()

  # Private
  _bind: ->
    return if @$element.hasClass @options.excludeClass
    @$element.tabs()

$.widget.bridge 'aaTabs', ActionPanel.Tabs
