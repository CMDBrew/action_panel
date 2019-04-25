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
#= require jquery-ui/widget
#= require jquery-ui/widgets/datepicker
#= require jquery-ui/widgets/dialog
#= require jquery-ui/widgets/sortable
#= require jquery-ui/widgets/tabs
#= require jquery_ujs
#= require popper
#= require bootstrap
#= require_self
#= require active_admin/lib/checkbox-toggler
#= require active_admin/lib/flash
#= require active_admin/lib/per_page
#= require active_admin/lib/table-checkbox-toggler
#= require active_admin/lib/has_many
#= require active_admin/initializers/datepicker
#= require active_admin/initializers/filters
#= require active_admin/initializers/tabs
#= require active_admin/ext/jquery-ui
#= require active_admin/ext/jquery
#= require_tree ./lib
#= require_tree ./initializers

window.ActiveAdmin = {}
window.WrapActiveAdmin = {}

@onDocReady = (element)->
  $(element).find('#main_content').waaBatchAction()
  $(element).find('.custom-file-input-group').waaFileInput()

onReady = ->
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
