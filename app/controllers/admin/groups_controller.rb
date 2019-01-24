class Admin::GroupsController < Admin::ApplicationController

  def index
    @groups = current_user.group_users
  end

  def new
  end

  def create
  end

  def show
    @event = Group.find(params[:id])
  end

  private
    def group_params
      # params.require(:event).permit(:name, :date, :is_allow_comment, :map)
    end
    
end
