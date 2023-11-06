class Admin::UsersController < ApplicationController
    def index
        @users = User.all
    end 
    
    def show
        @user = User.find(params[:id])
        @problems = @user.problems.all
    end 
end
