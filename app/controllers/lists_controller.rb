class ListsController < ApplicationController
before_action :get_list, only: [:show, :edit, :update, :destroy]
before_action :check_auth, only: [:edit, :update, :destroy]


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

  def edit

  end

  def update

  end

  def destroy

  end

  private def get_list
    @list = List.find_by_token(params[:id])
  end

  private def check_auth
    if current_user != @list.user
      render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
    end
  end
end
