class ActionPanel.HeaderToggler

  constructor: (@options, @element) ->
    @$element = $(@element)
    defaults  = {
      container: 'body'
      activeClass: 'header-active'
      cookieName: 'header-state'
    }
    @options = $.extend defaults, @options

    @_bind()

  _setCookie: (state)->
    expires_at = new Date()
    expires_at.setTime(expires_at.getTime() + (@options.expireInDays*24*60*60*1000));
    document.cookie = "#{@options.cookieName}=#{state};expires=#{expires_at.toGMTString()};path=/"

  _getCookie: ->
    name = "#{@options.cookieName}="
    decodedCookie = decodeURIComponent(document.cookie)
    ca = decodedCookie.split(';')
    i = 0
    while i < ca.length
      c = ca[i]
      while c.charAt(0) == ' '
        c = c.substring(1)
      if c.indexOf(name) == 0
        return c.substring(name.length, c.length)
      i++
    ''

  _remove: ->
    $(@options.container).removeClass @options.activeClass
    @_setCookie(null)

  _add: ->
    $(@options.container).addClass @options.activeClass
    @_setCookie(@options.activeClass)

  _bind: ->
    options = @options
    cookie = @_getCookie()

    if cookie == @options.activeClass
      @_add()

    @$element.on 'click', (e) =>
      e.preventDefault();
      if $(@options.container).hasClass @options.activeClass
        @_remove()
      else
        @_add()
      false

$.widget.bridge 'aaHeaderToggler', ActionPanel.HeaderToggler
