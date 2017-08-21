class Task < ApplicationRecord
  belongs_to :list
  validates :task_body, presence: true, length: {minimum: 2, maximum: 200}

  after_update -> {broadcast("update")}
  after_create -> {broadcast("create")}
  after_destroy -> {broadcast("destroy")}

  private def broadcast(action)
    ActionCable.server.broadcast "lists_#{list_id}_channel",
                                 action: action,
                                 id: id,
                                 task_body: task_body,
                                 done: done
  end


end
