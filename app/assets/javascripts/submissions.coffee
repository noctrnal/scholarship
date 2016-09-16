# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  if $("#submission_reapply:checked").length == 1
    $(".not-required-on-reapply").hide()

$(document).ready ->
  $("#submission_reapply").click ->
    $(".not-required-on-reapply").toggle()

