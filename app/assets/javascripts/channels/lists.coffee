jQuery(document).on 'turbolinks:load', ->

  list_id = $("#list").attr("list-id")

  App.global_chat = App.cable.subscriptions.create {
    channel: "ListsChannel"
    list_id: list_id
  },
    connected: ->
# Called when the subscription is ready for use on the server

    disconnected: ->
# Called when the subscription has been terminated by the server


    received: (data) ->
      if data.action == "destroy"
        $("#task_id_#{data.id}").fadeOut()
      else if data.action == "create"
        $("#Tasks").append("<tr id='task_id_#{data.id}'><td id='task_body_#{data.id}'>#{data.task_body}</td>" + \
          "<td><input type='checkbox' id='done_#{data.id}' disabled='true'></td></tr>")
      else if data.action == "update"
        document.getElementById("task_body_#{data.id}").innerHTML = data.task_body
      if data.done
        document.getElementById("done_#{data.id}").setAttribute("checked","")
      else
        document.getElementById("done_#{data.id}").removeAttribute("checked")
      return false


#      messages.append data['message']
#      messages_to_bottom()

#    send_message: (message, chat_room_id) ->
#      @perform 'send_message', message: message, chat_room_id: chat_room_id
