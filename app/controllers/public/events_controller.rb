class Public::EventsController < ApplicationController
  # M:Indent fixed
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]
    
  def index
    @events = Event.page(params[:page]).order(created_at: :desc)
  end 
  
  def show
    @event = Event.find(params[:id])
  end 
  
  def new
    @event = Event.new
  end 
  
  def create
    @event = Event.new(event_params)
    @event.owner_id = current_user.id
    if @event.save
      flash[:notice] = I18n.t("flash_notice.event.create")
      redirect_to events_path
    else
      render 'new'
    end 
  end 
  
  def edit 
    @event = Event.find(params[:id])
  end 
  
  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:notice] = I18n.t("flash_notice.event.update")
      redirect_to event_path(@event)
    else
      render 'edit'
    end 
  end 
  
  # M:To delete the event
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = I18n.t("flash_notice.event.destroy")
    redirect_to events_path
  end 
  
  # M:For the user to cancel joining the event
  def destroy_user
    @event = Event.find(params[:event_id])
    @event.users.delete(current_user)
    redirect_to event_path(@event)
  end 
  
  def join
    @event = Event.find(params[:event_id])
    @event.users << current_user
    redirect_to event_path(@event)
  end 
  
  private 
  def event_params
    params.require(:event).permit(:title, :caption, :image)
  end
  
  # M:Only the owner of the event can edit & update
  def ensure_correct_user
    @event = Event.find(params[:id])
    unless @event.owner_id == current_user.id
      redirect_to events_path
    end 
  end 
end
