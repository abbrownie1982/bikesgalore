class UserMailer < ApplicationMailer
  default from: "abbrownie@yahoo.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
        :to => 'abbrownie@yahoo.com',
        :subject => "A new contact form message from #{name}")
  end
end