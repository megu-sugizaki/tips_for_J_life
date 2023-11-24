class ContactMailer < ApplicationMailer
  # M:Indent fixed
  def contact_mail(contact, user)
    @contact = contact
    mail to: user.email, bcc: ENV["ACTION_MAILER_USER"], subject: "[Tips for J life] About your contact【auto sent】"
  end
end
