class Admin::UsersController < Admin::ApplicationController
  def index
    @user = current_user
  end
  
end
