class Api::EventsController < ApplicationController
  def index
    @events = Event.all()
  end

end
