class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin_only, :except => :show
  
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    case @user.role
    when 'user'
      @usersince = 'Usuario'
    when 'architect'
      @usersince = 'Arquitecto'
    when 'admin'
      @usersince = 'Administrador'
    end
    
    unless current_user.admin?
      redirect_to :back, :alert => 'Access denied.'
    end
  end
  
  def update
    @user = User.find(params[:id])
    unless current_user.admin?
      redirect_to :back, :alert => 'Access denied.'
    end
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => 'User update.'
    else
      redirect_to users_path, :alert => 'Unable to update user.'
    end
  end
  
  def destroy
    user = User.find(params[:id])
    unless current_user.admin?
      redirect_to :back, :alert => 'Access denied.'
    end
    user.destroy
    redirect_to users_path, :notice => 'User deleted.'
  end
  
  private
    def admin_only
      unless current_user.admin?
        redirect_to :back, :alert => 'Access denied.'
      end
    end
    
    def secure_params
      params.require(:user).permit(:role)
    end
end
