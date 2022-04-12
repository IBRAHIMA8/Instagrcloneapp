class ContactMailer < ApplicationMailer
  default from: 'hadi.ibrahima8@gmail.com'
  def contact_mail(contact, current_user)
      @contact = contact
   mail to: current_user.email, subject: "E-mail de retour de votre image postée"
 end
end
