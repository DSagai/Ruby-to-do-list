class ListsController < ApplicationController

  #GET /lists
  def index
    if current_user
      @lists = User.find(current_user.id).lists.all.order(:date)
    else
      redirect_to(new_user_session_path)
    end
  end

  def show
    @list = List.find_by_token(params[:id])
  end
end
