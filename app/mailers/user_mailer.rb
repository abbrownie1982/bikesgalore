class UserMailer < ApplicationMailer
  default from: "abbrownie@yahoo.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
        :to => 'abbrownie@yahoo.com',
        :subject => "A new contact form message from #{name}")
  end
  
  def welcome(user)
  @appname = "Bikes Galore"
  mail( :to => user.email,
        :subject => "Welcome to #{@appname}!")
        
  def order_created_email(order)
	@order = order
    mail(:from => 'giuliapenna88@gmail.com',
         :to => order.user.email,
         :subject => "Your Order ID: #{order.id} ")
  end
  end
end