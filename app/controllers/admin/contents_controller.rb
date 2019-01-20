class Admin::ContentsController < Admin::ApplicationController

  def index
    @content = Content.all
  end

  def new
    @content = Content.new
  end
  
end
