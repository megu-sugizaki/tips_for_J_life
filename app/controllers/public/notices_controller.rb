class Public::NoticesController < ApplicationController
  def show
    @notice = Notice.find(params[:id])
  end 
end

  private
  def notice_params
    params.require(:notice).permit(:title, :detail)
  end
