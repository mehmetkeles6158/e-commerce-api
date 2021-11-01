class OrdersController < ApplicationController

  # before_action :authenticate_user, only: [:show, :index, :create]

  def index
    if current_user
      orders = Order.all
      render json:orders
    else
      render json: {message: "You must be logged in first!"}
    end
  end

  def show
    
    order = Order.find_by(id:params[:id])
    if order.user_id == current_user.id
      render json:order
    else
      render json: {message:"your order not found!!!Probably you didn't give any order"}
    end
   
  end

  def create

    carted_products = CartedProduct.where(id: current_user.id)

    order_tax = 0
    order_subtotal = 0
    carted_products.each do|carted_product|
      order_subtotal += carted_product.product.price * carted_product.quantity
      order_tax += carted_product.product.tax * carted_product.quantity
    end

    order_total = rder_subtotal + order_tax
    order = Order.new(
    user_id: current_user.id,
    subtotal: order_subtotal,
    tax: order_tax,
    total: order_total
    )
    
    if order.save
      render json: order
    else
      render json: {errors: order.errors.full_messages}
    end
    
  end

end
