class Admin::UsersController < ApplicationController
    def index
        @users = User.all
    end 
    
    def update
        @user = User.find(params[:id])
        @user.update(is_active: false)
        reset_session
        flash[:notice] = "Successfully removed the user"
        redirect_to request.referer
    end 
    
    private
    
    def user_params
        params.require(:user).permit(:first_name, :middle_name, :last_name, :is_active, :email)
    end 
    

end
