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
      event = Event.find(event_id)
      map_ary = event.map.split(',')
      (map_ary[params[:content][:extraparam].to_i] = @content.id.to_s)
      event.assign_attributes({map: map_ary.join(',')})
      event.save
      redirect_to admin_event_path(event_id)
    else
      flash[:alert] = "Event failed"
      render 'new'
    end
  end

  def show
    @content = Content.find(params[:id])
  end

  def edit
    @content = Content.find(params[:id])

    render 'show' unless @content.user == current_user
  end

  def update
    @content = Content.find(params[:id])
    if @content.update_attributes(content_params)
      flash[:success] = "Event Created"
      render 'show'
    else
      flash[:alert] = "Event failed"
      render 'edit'
    end
  end
  
  
  private
    def content_params
      params.require(:content).permit(:name, :body, :image)
    end
  
end
