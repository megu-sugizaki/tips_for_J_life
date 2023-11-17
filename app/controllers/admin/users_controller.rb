class Admin::UsersController < ApplicationController
# M:Indent fixed
  def index
    @users = User.all
  end 
  
  def show
    @user = User.find(params[:id])
    @problems = @user.problems.all
    # M:To show all the problems posted by the user
    @events = @user.my_events
  end 
  
  def update
    @user = User.find(params[:id])
    @user.update(is_active: false)
    # M:To make the user log out
    reset_session
    redirect_to request.referer
  end 
  
  private
  def user_params
    params.require(:user).permit(:first_name, :middle_name, :last_name, :is_active, :email)
  end 
end
