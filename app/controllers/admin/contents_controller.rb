class Admin::ContentsController < Admin::ApplicationController

  def index
    @events = Contents.all
  end

  def new
    @event = Contents.new
  end
  
end
