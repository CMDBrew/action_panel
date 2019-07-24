class ActiveAdminBootstrap.Dropdown

  constructor: (@options, @element) ->
    @$element = $(@element)
    defaults  = {
      toggle: '.dropdown-toggle'
      menu: '.dropdown-menu'
    }
    @options = $.extend defaults, @options

    @_bind()

  # Private
  _bind: ->
    options = @options
    $dropdown = @$element.find(options.menu)
    $toggle   = @$element.find(options.toggle)

    @$element.on 'show.bs.dropdown', ->
      $('body').append $dropdown.detach()

    @$element.on 'hidden.bs.dropdown', ->
      $(@).append $dropdown.detach()

$.widget.bridge 'aaDropdown', ActiveAdminBootstrap.Dropdown
