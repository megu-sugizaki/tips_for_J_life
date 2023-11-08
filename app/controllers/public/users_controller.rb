class Public::UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]
  
  def show
      @user = User.find(params[:id])
      @problems = @user.problems.all
      # To show all the problems posted by the user
      
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
  
  def bookmark
    @user = User.find(params[:id])
    # To find problems the user bookmarked
    @bookmark_problems = @user.bookmark_problems
    
  end 
  
  def bookmarked
    @user = User.find(params[:id])
    # To find user's bookmarked problems
    @problems = @user.problems.includes(:bookmarks).select{|o| o.bookmarks.any? }
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
