class Public::HomesController < ApplicationController
  # M:Indent fixed
  def top
    @notices = Notice.all
  end
  
  def about
  end 
end
