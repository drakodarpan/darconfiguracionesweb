class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @user = User.all
  end

  def show
  end
end
