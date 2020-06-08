class ActionPanel.Snakebar

  constructor: (@options, @element) ->
    @$element = $(@element)

    defaults = {
      bodyClass: 'has-snakebar'
      activeClass: 'active',
      itemClass: 'flash',
      container: '#bottom-nav',
      destroyDelay: 5000,
      itemDelay: 6000
    }

    @options = $.extend defaults, @options
    @_bind()

  _show: (el)->
    $('body').addClass(@options.bodyClass)
    $(el).addClass(@options.activeClass).delay(@options.destroyDelay)
          .prependTo(@options.container).queue((next) =>
      $(el).hide().delay(3000).queue ->
        $(@).remove()

      $('body').removeClass(@options.bodyClass)
      next()
    )

  _bind: ->
    @configs = @$element.data('snakebar') || {}
    @options = $.extend @options, @configs

    delay = @options.itemDelay

    @$element.find(".#{@options.itemClass}").each (index, el)=>
      setTimeout (=>
        @_show(el)
      ), delay * index

$.widget.bridge 'aaSnakebar', ActionPanel.Snakebar
