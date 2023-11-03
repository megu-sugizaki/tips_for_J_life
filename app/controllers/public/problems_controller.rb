class Public::ProblemsController < ApplicationController
    before_action :is_matching_login_user, only:[:edit, :update]
    
    def new
        @problem = Problem.new
    end 
    
    def create
        @problem = Problem.new(problem_params)
        @problem.user_id = current_user.id
        @problems = Problem.all
        if @problem.save
            flash[:notice] = "You have posted problem successfully"
            redirect_to problem_path(@problem.id)
        else
            flash.now[:notice]
            render :index
        end
    end 
    
    def index
        @problem = Problem.new
        @problems = Problem.all
    end 
    
    def show
        @problem_new = Problem.new
        @problem = Problem.find(params[:id])
        @user = @problem.user
    end 
    
    def edit
        @problem = Problem.find(params[:id])
    end 
    
    def update
        @problem = Problem.find(params[:id])
        @problem.user_id = current_user.id
        
        if @problem.update(problem_params)
            flash[:notice] = "You have updated your post successfully."
            redirect_to problem_path(@problem.id)
        else 
            flash.now[:notice]
            render :edit
        end 
    end 
    
    def destroy
        problem = Problem.find(params[:id])
        problem.destroy
        redirect_to problems_path
    end 
    
    private
    
    def problem_params
        params.require(:problem).permit(:title, :caption, problem_images: [])
    end 
    
    def is_matching_login_user
        problem = Problem.find(params[:id])
        unless problem.user.id == current_user.id
            redirect_to problems_path
        end 
    end 
end
