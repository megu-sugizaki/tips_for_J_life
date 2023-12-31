class Admin::UsersController < ApplicationController
  # M:Indent fixed
  before_action :authenticate_admin!
  
  def index
    @users = User.page(params[:page]).order(created_at: :desc)
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
    redirect_to request.referer
  end 
  
  private
  def user_params
    params.require(:user).permit(:first_name, :middle_name, :last_name, :is_active, :email)
  end 
end
