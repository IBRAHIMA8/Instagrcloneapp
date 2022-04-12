class ContactMailer < ApplicationMailer
  def contact_mail(contact, current_user_info)
   @contact = contact
   mail to: @contact_email, subject: "E-mail de confirmation de demande"
 end
end
