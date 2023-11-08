class Admin::UsersController < ApplicationController
    def index
        @users = User.all
    end 
    
    def update
        @user = User.find(params[:id])
        @user.update(is_active: false)
        reset_session
        flash[:notice] = "退会処理を実行いたしました"
        redirect_to request.referer
    end 

end
