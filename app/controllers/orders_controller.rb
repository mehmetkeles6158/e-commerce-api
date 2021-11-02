class OrdersController < ApplicationController

  before_action :authenticate_admin

  def index
    orders = Order.where(user_id: current_user.id)
    render json: orders
  end

  def show
    order = Order.find_by(id: params[:id], user_id: current_user.id)
    # order = current_user.orders.find_by(id: params[:id])
    render json: order, include: "carted_products.product"
  end

  

  def create
    carted_products = current_user.carted_products.where(status: "carted")
    
    order_subtotal = 0
    carted_products.each do|carted_product|
      order_subtotal += carted_product.product.price * carted_product.quantity
    end

    tax_rate = 0.09
    order_tax = order_subtotal * tax_rate
    order_total = order_subtotal + order_tax
    
    order = Order.new(
    user_id: current_user.id,
    subtotal: order_subtotal,
    tax: order_tax,
    total: order_total
    )
    order.save

    carted_products.each do |carted_product|
      carted_product.status = "purchased"
      carted_product.order_id = order.id
      carted_product.save
    end
    render json: order



    #if 
    #   render json: order
    # else
    #   render json: {errors: order.errors.full_messages}
    # end
    
  end

end
