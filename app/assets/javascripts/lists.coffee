$(document).on('turbolinks:load', ->
  $("#new_task").bind('ajax:complete', ->
    $("#task_task_body").val("")))
