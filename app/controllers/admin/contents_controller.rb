class Admin::ContentsController < Admin::ApplicationController

  def index
    @content = Content.all
  end

  def new
    @content = Content.new
  end

  def create
    event_id = params[:event_id]

    @content = current_user.contents.build(content_params)
    @content.assign_attributes({event_id: event_id})
    if @content.save
      flash[:success] = "Event Created"
      redirect_to admin_event_path(event_id)
    else
      flash[:alert] = "Event failed"
      render 'new'
    end
  end
  
  private
    def content_params
      params.require(:content).permit(:name, :body, :image_path)
    end
  
end
