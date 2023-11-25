class Public::ProblemTagsController < ApplicationController
  # M:Indent fixed
  before_action :authenticate_user!
  
  def index
    @problem_tag = ProblemTag.new
    @problem_tags = ProblemTag.all.order(created_at: :desc)
  end
  
  def create
    @problem_tag = ProblemTag.new(problem_tag_params)
    # M:To show the "edit" button only to the current user
    @problem_tag.user_id = current_user.id
    if @problem_tag.save
      flash[:notice] = I18n.t("flash_notice.tag.create")
    else
      flash[:alert] = I18n.t("flash_alert.tag.create")
    end
    redirect_to request.referer
  end 
  
  def edit
    @problem_tag = ProblemTag.find(params[:id])
  end 
  
  def update
    @problem_tag = ProblemTag.find(params[:id])
    if @problem_tag.update(problem_tag_params)
      redirect_to problem_tags_path, notice: I18n.t("flash_notice.tag.update")
    else
      render :edit
    end
  end 
  
  # M: No need to delete tag. Afraid of finding no tag_id on user's post after deleting tag.
  # def destroy
  #  problem_tag = ProblemTag.find(params[:id])
  #  problem_tag.destroy
  #  redirect_to problem_tags_path
  # end 

  private
  def problem_tag_params
    params.require(:problem_tag).permit(:name)
  end 
end
