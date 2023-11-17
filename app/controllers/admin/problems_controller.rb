class Admin::ProblemsController < ApplicationController
    
  def index
    @problems = Problem.all
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
