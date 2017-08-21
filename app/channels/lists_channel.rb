class ListsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "lists_#{params['list_id']}_channel"
  end
end