class Admin::GroupsController < Admin::ApplicationController

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)
    if @group.save
      flash[:success] = "Event Created"
      redirect_to admin_groups_path
    else
      render 'new'
    end
  end

  def show
    @event = Group.find(params[:id])
  end

  private
    def group_params
      params.require(:group).permit(:name)
    end
    
end
