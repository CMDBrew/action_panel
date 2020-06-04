class ActionPanel.PasswordInput

  constructor: (@options, @element) ->
    @$element = $(@element)
    @$input = @$element.find('input[type="password"]')

    defaults = {
      toggler: '.password-toggler'
      activeClass: 'show'
    }

    @options = $.extend defaults, @options
    @_bind()

  _toggle: ->
    input = @$input[0]
    if @$input[0].type == 'password'
      input.type = 'text'
      @$element.addClass @options.activeClass
    else
      input.type = 'password'
      @$element.removeClass @options.activeClass

  _bind: ->
    @configs = @$element.data('custom-password') || {}
    @options = $.extend @options, @configs

    @$element.on 'click', @options.toggler, (e)=>
      e.preventDefault()
      @_toggle()
      false

$.widget.bridge 'aaPasswordInput', ActionPanel.PasswordInput
