class Admin::ProblemCommentsController < ApplicationController
    
    def destroy
        problem = Problem.find(params[:problem_id]) 
        problem_comment = ProblemComment.find(params[:id])
        problem_comment.destroy
        redirect_to request.referer
    end 
    
    private
    
    def problem_comment_params
        params.require(:problem_comment).permit(:comment)
    end 
    
end
