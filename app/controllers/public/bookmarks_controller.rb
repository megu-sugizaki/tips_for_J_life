class Public::BookmarksController < ApplicationController
    
    def create
        @bookmark = current_user.bookmarks.build(problem_id: params[:id])
        @bookmark.save!
        # To go back to the page right before, if not, back to root_path
        redirect_back fallback_location: root_path, success: t('defaults.message.bookmark')
    end 
    
    def destroy
        current_user.bookmarks.find_by(problem_id: params[:id]).destroy!
        redirect_back fallback_location: root_path, success: t('defaults.message.not_bookmark')
    end 
end
