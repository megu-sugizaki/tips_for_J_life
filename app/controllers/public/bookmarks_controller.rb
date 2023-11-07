class Public::BookmarksController < ApplicationController
    
    def create
        # 連打防止
        @bookmark = current_user.bookmarks.find_or_create_by(problem_id: params[:problem_id])
        # To go back to the page right before, if not, back to root_path
        redirect_back fallback_location: root_path, success: t('defaults.message.bookmark')
    end 
    
    def destroy
        # &=ぼっち演算子
        current_user.bookmarks.find_by(problem_id: params[:problem_id])&.destroy!
        redirect_back fallback_location: root_path, success: t('defaults.message.not_bookmark')
    end 
end
