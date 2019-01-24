class Api::EventsController < ApplicationController
  def index
    @events = Event.all()
  end

  def show
    @event = Event.includes(:contents).find_by(id: params[:id])
  end
end
