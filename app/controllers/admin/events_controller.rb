class Admin::EventsController < ApplicationController
    
  def index
    @events = Event.all
  end 
  
  def show
    @event = Event.find(params[:id])
  end 
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to admin_events_path
  end 
  
  private
  def event_params
    params.require(:event).permit(:title, :caption)
  end
end
