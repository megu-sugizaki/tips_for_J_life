class Public::UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]
  
  
  
  def show
      @user = current_user
  end 
    
    
   def ensure_guest_user
     @user = User.find(params[:id])
     if @user.guest_user?
       redirect_to user_path(current_user) , notice: "Guest users may not move to edit"
     end
   end 
end
