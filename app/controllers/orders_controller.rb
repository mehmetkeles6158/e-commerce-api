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

    product = Product.find_by(id: params[:product_id])
    calculated_subtotal = params[:quantity].to_i * product.price
    calculated_tax = product.tax
    calculated_total = calculated_subtotal + calculated_tax

    order = Order.new(
    user_id: params[:user_id],
    product_id: product.id,
    quantity: params[:quantity],
    subtotal: calculated_subtotal,
    tax: calculated_tax,
    total: calculated_total
    )
    if order.save
      render json: order
    else
      render json: {errors: order.errors.full_messages}
    end
    
  end

end
