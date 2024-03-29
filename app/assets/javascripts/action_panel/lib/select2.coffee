_template_state = (state) ->
  if !state.id
    return state.text
  $state = $($(state.element).data('template'))
  $state

_result_state = (state) ->
  if !state.id
    return state.text
  template = $(state.element).data('result-template') || $(state.element).data('template')
  $state = $(template)
  $state


class ActionPanel.Select2

  constructor: (@options, @element) ->
    @$element = $(@element)

    defaults = {
      'theme': 'bootstrap4'
      'width': '100%'
      'minimumResultsForSearch': Infinity
    }

    @options = $.extend defaults, @options
    @_bind()

  _dynamic_opts: ->
    placeholder = @$element.data('select2-placeholder')
    clear = @$element.data('select2-clear')

    if(placeholder)
      $.extend(@options, { placeholder: placeholder })

    if(clear)
      $.extend(@options, { allowClear: true })
    @

  _template_opts: ->
    @options = $.extend(@options, {
      templateResult: _template_state
    })

  _selection_template_opts: ->
    @options = $.extend(@options, {
      templateSelection: _result_state
    })

  _multiple_opts: ->
    @options = $.extend(@options, {
      'closeOnSelect': true
    })

  _search_opts: ->
    @options = $.extend(@options, { minimumResultsForSearch: 0 })

  _other_opts: ->
    @options = $.extend(@options, {
      tags: true,
      createTag: (params) =>
        {
          id: params.term
          text: params.term
          newOption: true
        }
      templateResult: (data) =>
        $result = $('<span></span>')
        $result.text(data.text)
        $result
    })

  destroy: ->
    @$element.select2('destroy')

  _bind: ->
    @configs = @$element.data('select2-options') || {}
    @options = $.extend @options, @configs

    @_dynamic_opts()

    if(@$element.hasClass('select2-hidden-accessible'))
      @_destroy()

    if(@$element.data('select2-search'))
      @_search_opts()

    if(@$element.data('select2-other'))
      @_other_opts()

    if(@$element.data('select2-template'))
      @_template_opts()

    if(@$element.data('select2-selection-template'))
      @_selection_template_opts()

    if(@$element).attr('multiple')
      @_multiple_opts()

    @$element.select2(@options)
    @

$.widget.bridge 'aaSelect2', ActionPanel.Select2
