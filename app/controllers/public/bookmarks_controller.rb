class Public::BookmarksController < ApplicationController
  before_action :authenticate_user!
  # M:Indent fixed
  def create
    # M:To prevent consecutive hits
    @bookmark = current_user.bookmarks.find_or_create_by(problem_id: params[:problem_id])
    # M:To go back to the page right before, if not, back to root_path
    #redirect_back fallback_location: root_path, success: t('defaults.message.bookmark')
    # M:To make it asynchronous communication
    redirect_to request.referer
  end 
  
  def destroy
    # M:&=safe navigation operator (ref botchi enzanshi in Jp)
    current_user.bookmarks.find_by(problem_id: params[:problem_id])&.destroy!
    #redirect_back fallback_location: root_path, success: t('defaults.message.not_bookmark')
    # M:To make it asynchronous communication
    redirect_to request.referer
  end 
end
