class Admin::EventsController < Admin::ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.new(event_params)

    if @event.save
      flash[:success] = "Event Created"
      redirect_to admin_users_path
    else
      render 'new'
    end
  end
  def show
    @event = Event.includes(:contents).find(params[:id])
  end

  private
    def event_params
      params.require(:event).permit(:name, :date, :is_allow_comment, :map, :thumbnail)
    end
    
end
