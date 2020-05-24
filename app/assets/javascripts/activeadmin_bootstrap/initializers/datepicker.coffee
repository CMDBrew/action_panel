$.fn.datepicker.dates['en'] = {
    days: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
    daysShort: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
    daysMin: ["S", "M", "T", "W", "T", "F", "S"],
    months: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
    monthsShort: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
    today: "Today",
    clear: "Clear",
    format: "mm/dd/yyyy",
    titleFormat: "MM yyyy",
    weekStart: 0
};

onDOMReady = ->
  $(document).on 'focus', 'input.datepicker:not(.hasDatepicker)', ->
    input = $(@)

    # Only create datepickers in compatible browsers
    return if input[0].type is 'date'

    defaults = {
      todayHighlight: true
      todayBtn: true
      clearBtn: true
      locale: 'en'
      format: 'yyyy-mm-dd'
      templates:
        leftArrow: '<i class="mdi mdi-chevron-left"></i>'
        rightArrow: '<i class="mdi mdi-chevron-right"></i>'
    }
    options  = input.data 'datepicker-options'
    input.datepicker $.extend(defaults, options)

$(document).
  ready(onDOMReady).
  on 'page:load turbolinks:load', onDOMReady
