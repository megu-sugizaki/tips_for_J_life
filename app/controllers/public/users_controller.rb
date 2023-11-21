class Public::UsersController < ApplicationController
  # M:Indent fixed
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]
  
  def show
    @user = User.find(params[:id])
    @problems = @user.problems.page(params[:page]).order(created_at: :desc)
    # M:To show all the problems posted by the user
    @events = @user.my_events.page(params[:page]).order(created_at: :desc)
  end 
  
  def edit
    @user = current_user
  end 
  
  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = I18n.t("flash_notice.user.update")
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end 
  
  def check
  end 
  
  def destroy
    #M:user doesn't have to "leave" but destroy their account. Only admin has "leave" function to change their status
    current_user.destroy
    redirect_to root_path, notice: I18n.t("flash_notice.user.destroy")
  end
  
  def events
    @events = Event.all
  end 
  
  def bookmark
    @user = User.find(params[:id])
    # To find problems the user bookmarked
    @bookmark_problems = @user.bookmark_problems
  end 
  # M:Not necessary?
  # def bookmarked
  #   @user = User.find(params[:id])
  #   # To find user's bookmarked problems
  #   @problems = @user.problems.includes(:bookmarks).select{|o| o.bookmarks.any? }
  # end
  
  private
  def user_params
      params.require(:user).permit(:first_name, :middle_name, :last_name, :introduction, :profile_image, :locale)
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
