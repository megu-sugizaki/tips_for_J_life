class Public::ProblemsController < ApplicationController
    before_action :is_matching_login_user, only:[:edit, :update]
    
    def new
        @problem = Problem.new
        
        # To create new tag
        @problem_tag = ProblemTag.new
        
        # To create problem tag select box
        @problem_tags = ProblemTag.all
        
        # Description below won't be used. Changed to f.collection_select in the view page.
        # select_problem_tags = @problem_tags.pluck(:name)
        
        # @select_array = []
        # select_problem_tags.each_with_index do |problem_tag_name, i|
        #     problem_tag_array = [problem_tag_name, i + 1]
        #     @select_array.push(problem_tag_array)
        # end
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
        @problem_new = Problem.new
        @problems = Problem.all
        
        # To create new tag
        @problem_tag = ProblemTag.new
        
        # To create problem tag select box
        @problem_tags = ProblemTag.all
        
        # if @problems = params[:problem_tag_id].present?
        #     ProblemTag.find(params[:problem_tag_id]).problem
        # end 
        
        if params[:keyword] || params[:problem_tag_id]
            @problems = @problems.search(params[:keyword], params[:problem_tag_id])
        end 
        @keyword = params[:keyword]
        @problem = current_user.bookmark_problems.includes(:user).order(created_at: :desc)
        # Description for tag select box below is no longer necessary. Changed to f.collection_select in the view page.
        # select_problem_tags = @problem_tags.pluck(:name)
        
        # @select_array = []
        # select_problem_tags.each_with_index do |problem_tag_name, i|
        #     problem_tag_array = [problem_tag_name, i + 1]
        #     @select_array.push(problem_tag_array)
        # end
    end 
    
    def show
        @problem_new = Problem.new
        @problem = Problem.find(params[:id])
         # M:To tell if the user == current_user to show the edit button
        @user = @problem.user
       # M:To post comments to the problem
        @problem_comment = ProblemComment.new
        @bookmark_problem = current_user.bookmark_problems.includes(:user).order(created_at: :desc)
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
        flash[:notice] = "You have deleted your post successfully."
        redirect_to problems_path
    end 
    
    # def bookmarks
    #     # M:To see users who bookmarked the problem? Not sure what this sentence wants to do
    #     @problem = current_user.bookmark_problems.includes(:user).order(created_at: :desc)
    # end 
            
end
    
    private
    
    def problem_params
        params.require(:problem).permit(:title, :caption, problem_tag_ids: [], problem_images: [])
    end 
    
    def is_matching_login_user
        problem = Problem.find(params[:id])
        unless problem.user.id == current_user.id
            redirect_to problems_path
        end 
    end 
