class Public::ProblemTagsController < ApplicationController
    
    def index
        @problem_tag = ProblemTag.new
        @problem_tags = ProblemTag.all
    end
    
    def create
        @problem_tag = ProblemTag.new
        @problem_tag.save
    end 
    
    def destroy
    end 
    
    private
    def problem_tag_params
        params.require(:problem_tag).permit(:name, problem_tag_ids: [])
    end 
end
