class Api::EventsController < ApplicationController
  def index
    @events = Event.all()
  end

  def show
    @event = Event.find_by(id: params[:id])
    render json: @event, status: :ok if @event.present?
  end
end
