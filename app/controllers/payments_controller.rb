class PaymentsController < ApplicationController
  before_action :authenticate_user!
  def create
    token = params[:stripeToken]
    @product = Product.find(params[:product_id])
    @user = current_user
  
  
  begin
    charge = Stripe::Charge.create(
      :amount => (@product.price * 100).to_i,
				:currency => 'usd',
				:source => token,
				:description => @product.name + " purchased by " + params[:stripeEmail],
				:receipt_email => @user.email
      )
    if charge.paid
      Order.create(
        product_id: @product.id,
        user_id: @user.id,
        total: @product.price
        )
    end


  rescue Stripe::CardError => e
    # The card has been declined
    body = e.json_body
    err = body[:error]
    flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
  end
  end
   
end