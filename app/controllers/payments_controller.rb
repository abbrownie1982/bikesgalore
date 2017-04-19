class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def create
  token = params[:stripeToken]
  @product = params[:product_id]
  @user = current_user
    begin
      charge = Stripe::Charge.create(
        :amount => @product.price, 
        :currency => "usd",
        :source => token,
        :description => params[:stripeEmail]
      )

      if charge.paid
        Order.create!(
          user_id: @user.id,
          product_id: @product.id,
          total: @product.price
          )
      end
      rescue Stripe::CardError => e
      body = e.json_body
      err = body[:error]
      flash[:error] = "I'm sorry, there was a problem processeing your payment: #{err[:message]}"
    end
    redirect_to product_path(@product), notice: "Thank you for your purchase!"
  end
end