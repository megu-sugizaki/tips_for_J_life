class Public::HomesController < ApplicationController
  # M:Indent fixed
  def top
    @notices = Notice.all.order(created_at: :desc)
  end
  
  def about
  end 
end
