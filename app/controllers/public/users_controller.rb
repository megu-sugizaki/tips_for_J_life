class Public::UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]
  
  def show
      @user = current_user
      @problem = @user.problems.all
  end 
  
  def edit
      @user = current_user
  end 
  
  def update
      @user = current_user
      if @user.update(user_params)
        redirect_to user_path(@user.id)
      else
        render :edit
      end
  end 
  
  def check
  end 
  
  def destroy
    #   M:user doesn't have to "leave" but destroy their account. Only admin has "leave" function to change their status
      current.user.destroy
      redirect_to root_path, notice: "You are no longer a user of this website"
  end 
  
  private
  
  def user_params
      params.require(:user).permit(:first_name, :middle_name, :last_name, :introduction, :profile_image)
  end 
    
   def ensure_guest_user
     def guest_user
         current_user.email == "guest@example.com"
     end 
     
     if current_user == guest_user
       redirect_to user_path(current_user) , notice: "Guest users may not move to edit"
     end
   end 
end
