class Admin::NoticesController < ApplicationController
  before_action :authenticate_admin!
    
  def new
    @notice = Notice.new
  end 
  
  def create
    @notice = Notice.new(notice_params)
    if @notice.save
      flash[:notice] = "You have created a notice successfully"
      redirect_to admin_notice_path(@notice)
    else
      flash[:notice]
      render :new
    end 
  end 
  
  def index
    @notices = Notice.page(params[:page]).order(created_at: :desc)
  end 
  
  def show
    @notice = Notice.find(params[:id])
  end 
  
  def destroy
    @notice = Notice.find(params[:id])
    @notice.destroy
    flash[:notice] = "You have deleted a notice successfully."
    redirect_to admin_notices_path
  end 
end

private
def notice_params
  params.require(:notice).permit(:title, :detail)
end 