class TasksController < ApplicationController
  before_action :get_list, only: [:check_owner, :create, :show, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]

  def index
    @tasks = @list.tasks.all
  end


  def create
    puts params[:task]
    @task = @list.tasks.create(params.require("task").permit("task_body", "done"))
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @task = @list.tasks.find(params[:id])
    if @task.destroy
    end
    respond_to do |format|
      format.js
    end
  end

  def update
    @task = @list.tasks.find(params[:id])
    puts(params[:task])
    if @task.update_attributes(params.require("task").permit("task_body", "done"))
      redirect_to @list, notice: 'Task was successfully updated.'
    else
      redirect_to @list, status: :unprocessable_entity
    end

  end


  def edit
    @task = @list.tasks.find(params[:id])
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
