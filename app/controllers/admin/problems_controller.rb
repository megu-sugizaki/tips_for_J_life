class Admin::ProblemsController < ApplicationController
  # M:Indent fixed
  before_action :authenticate_admin!
  
  def index
    @problems = Problem.page(params[:page]).order(created_at: :desc)
  end 
  
  def show
    # M:Need show page to delete the inappropriate comments
    @problem = Problem.find(params[:id])
    @problem_comments = @problem.problem_comments.all
  end 
  
  def destroy
    @problem = Problem.find(params[:id])
    @problem.destroy
    redirect_to admin_problems_path
  end 
  
  private
  def problem_params
    params.require(:problem).permit(:title, :caption)
  end 
end
