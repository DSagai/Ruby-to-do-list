class TasksController < ApplicationController
before_action :get_list, only: [:index, :create]

  def index
    @tasks = @list.tasks.all
  end


  def create
    @task = list.tasks.create(task_body: params[:task][:task_body])
    respond_to do |format|
      format.js
    end
  end

  private def get_list
    @list = List.find_by_token(params[:list_id])
  end
end
