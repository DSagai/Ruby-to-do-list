class TasksController < ApplicationController
  before_action :get_list, only: [:check_owner, :create, :show, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]

  def index
    @tasks = @list.tasks.all
  end


  def create
    @task = @list.tasks.create(task_body: params[:task][:task_body])
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @task = @list.tasks.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.js
    end
  end

  private def get_list
    @list = List.find(params[:list_id])
  end

  private def check_owner
    if current_user != @list.user
      render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
    end
  end

end
