class OrdersController < ApplicationController

  def index
    orders = Order.all
    render json:orders
  end

  def show
    the_id = params["id"]
    order = Order.find_by(id:the_id)
    render json:order

  end

  def create

    order = Order.new(
    user_id: params[:user_id],
    product_id: params[:product_id],
    quantity: params[:quantity],
    subtotal: params[:subtotal],
    tax: params[:tax],
    total: params[:total]
    )
    order.save

    render json:order
    
  end

end
