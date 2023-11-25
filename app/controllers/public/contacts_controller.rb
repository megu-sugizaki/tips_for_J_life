class Public::ContactsController < ApplicationController
  #M:Indent fixed
  before_action :authenticate_user!
  
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact, current_user).deliver
      redirect_to root_path, notice: I18n.t("flash_notice.notice.create")
    else
      render :new
    end
  end

  private
  # M:Only allow a list of trusted parameters through.
  def contact_params
    params.require(:contact).permit(:name, :content)
  end
end
