class ListsController < ApplicationController
  before_action :get_list, only: [:check_owner, :show, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]


  #GET /lists
  def index
    if current_user
      @lists = User.find(current_user.id).lists.all.order(:date)
    else
      redirect_to(new_user_session_path)
    end
  end

  def show
    if @list.user == current_user
      render :edit
    end
  end

  def create
    if current_user
      @list = current_user.lists.create(date: params[:list][:date])
      respond_to do |format|
        format.js
      end
    else
      render :file => "#{Rails.root}/public/422", :layout => false, :status => :forbiden
    end
  end

  def edit

  end

  def update
    if @list.update(date: params[:list][:date])
      # render action: "edit", notice: 'List was successfully updated.'
      redirect_to list_path(@list.link_token), notice: 'List date was successfully updated to ' + @list.date.to_s
    else
      render action: "edit", notice: 'List update was unsuccessful.'
    end
  end

  def destroy
    @list.destroy
    respond_to do |format|
      format.js
    end
  end

  private def get_list
    @list = List.find(params[:id])
  end

  private def check_owner
    if current_user != @list.user
      render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
    end
  end
end
