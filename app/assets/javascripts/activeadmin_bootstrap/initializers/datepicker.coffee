onDOMReady = ->
  $(document).on 'focus', 'input.datepicker:not(.hasDatepicker)', ->
    input = $(@)

    # Only create datepickers in compatible browsers
    return if input[0].type is 'date'

    defaults = {
      todayHighlight: true
      todayBtn: true
      clearBtn: true
      format: 'yyyy-mm-dd'
      templates:
        leftArrow: '<i class="fa fa-chevron-left"></i>'
        rightArrow: '<i class="fa fa-chevron-right"></i>'
    }
    options  = input.data 'datepicker-options'
    input.datepicker $.extend(defaults, options)

$(document).
  ready(onDOMReady).
  on 'page:load turbolinks:load', onDOMReady
