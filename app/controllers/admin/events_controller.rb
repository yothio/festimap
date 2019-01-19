class Admin::EventsController < ApplicationController
  layout 'admin'

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end
  
end
