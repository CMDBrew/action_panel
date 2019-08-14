# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file. JavaScript code in this file should be added after the last require_* statement.
#
# Read Sprockets README (https:#github.com/rails/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery3
#= require jquery-ui/widgets/datepicker
#= require jquery-ui/widgets/dialog
#= require jquery-ui/widgets/sortable
#= require jquery-ui/widgets/tabs
#= require jquery-ui/widget
#= require jquery_ujs
#= require popper
#= require bootstrap
#= require bootstrap-datepicker
#= require moment
#= require moment/es.js
#= require fullcalendar
#= require select2-full
#= require jquery.minicolors
#= require trix
#= require_self
#= require active_admin/ext/jquery-ui
#= require active_admin/ext/jquery
#= require active_admin/lib/active_admin
#= require active_admin/lib/checkbox-toggler
#= require active_admin/lib/per_page
#= require active_admin/lib/table-checkbox-toggler
#= require active_admin/lib/has_many
#= require active_admin/initializers/filters
#= require_tree ./lib
#= require_tree ./initializers

window.ActiveAdmin = {}
window.ActiveAdminBootstrap = {}

@onDocReady = (element)->
  $(element).find('#main_content').aaBatchAction()
  $(element).find('.custom-file-input-group').aaFileInput()
  $(element).find('.tabs').aaTabs()
  $(element).find('.form-control.select2').aaSelect2()
  $(element).find('.form-control.minicolors').aaColorPicker()

onReady = ->
  $('#active_admin_content .dropdown:not(.filter-dropdown)').aaDropdown()
  $('#header').on 'hide.bs.collapse', ->
    $('body').removeClass('header-active')
  $('#header').on 'show.bs.collapse', ->
    $('body').addClass('header-active')
  $('#sidebar-content').on 'hide.bs.collapse', ->
    $('body').removeClass('sidebar-active')
  $('#sidebar-content').on 'show.bs.collapse', ->
    $('body').addClass('sidebar-active')

$(document).ready(->
    onReady()
    onDocReady(document)
  ).on 'page:load turbolinks:load', ->
    onReady()
    onDocReady(document)

$(document)
  .on 'has_many_add:after', '.has_many_container', (e, fieldset, container) ->
    onDocReady(fieldset[0])
