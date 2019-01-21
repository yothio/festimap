class Api::EventsController < ApplicationController
  def index
    @events = Event.all()
  end

  def event
    @event = Event.find_by(id: params[:id])
    if @event
      render json: @event, status: :ok
    end
    
  end


end
