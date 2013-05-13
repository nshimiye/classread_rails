# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $("button#submit").click ->
    $.ajax
      type: "POST"
      url: $("form").attr("action")
      data: $("form.contact").serialize()
      success: (msg) ->
        $("#thanks").html(msg)
        $("#myModal").modal("hide")

      error: ->
        alert "failure"
