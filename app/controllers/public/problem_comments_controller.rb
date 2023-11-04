class Public::ProblemCommentsController < ApplicationController
    before_action :set_comment, only: [:update, :destroy]
    before_action :authenticate_user!
    
    def create
        problem = Problem.find(params[:problem_id])
        comment = current_user.problem_comments.new(problem_comment_params)
        comment.problem_id = problem.id
        comment.save
        redirect_to problem_path(problem)
    end 
    
    def destroy
      problem = Problem.find(params[:problem_id]) 
      ProblemComment.find(params[:id]).destroy
      redirect_to problem
    end
    
    # def update
    #     problem_comment = current_user.problem_comments.find(params[:id])
    #     @problem_comment.reload unless @problem_comment.update(comment_update_params)
        
    # end 
    
    private
    
    def set_comment
        @problem_comment = current_user.problem_comments.find(params[:id])
    end 
    
    def problem_comment_params
        params.require(:problem_comment).permit(:comment)
    end 
    
end
