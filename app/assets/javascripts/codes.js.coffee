# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#register_code_form").submit ->
    $(this).attr("action", "/register_code/" + $(this).find("#code").val())
