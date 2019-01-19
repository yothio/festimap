class Admin::EventsController < Admin::ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end
  
end
