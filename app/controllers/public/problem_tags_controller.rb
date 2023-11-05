class Public::ProblemTagsController < ApplicationController
    
    def index
        @problem_tag = ProblemTag.new
        @problem_tags = ProblemTag.all
    end
    
    def create
        @problem_tag = ProblemTag.new(problem_tag_params)
        @problem_tag.user_id = current_user.id
        @problem_tag.save
        redirect_to request.referer
    end 
    
    def edit
        @problem_tag = ProblemTag.find(params[:id])
    end 
    
    def update
        @problem_tag = ProblemTag.find(params[:id])
        if @problem_tag.update
            redirect_to problem_tags_path, notice: "You have successfully updated tag name!"
        else
            flash.now[:alert] = "Failed updating tag name"
            render :edit
        end
    end 
    
    def destroy
        problem_tag = ProblemTag.find(params[:id])
        problem_tag.destroy
    end 
    
    private
    def problem_tag_params
        params.require(:problem_tag).permit(:name)
    end 
end
