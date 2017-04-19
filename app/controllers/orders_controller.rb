class OrdersController < ApplicationController
	before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @Orders = Order.where("user_id =?", current_user.id)
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
  end


end