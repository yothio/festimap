class Admin::UsersController < ApplicationController
  layout 'admin'
  def index
    @user = current_user
  end
  
end
