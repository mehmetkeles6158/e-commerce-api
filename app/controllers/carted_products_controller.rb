class CartedProductsController < ApplicationController

  def index
    # only  the carted products thay have my user id and status carted!
    carted_products = current_user.carted_products.where(status: "carted")
    render json: carted_products
  end

  def create

    # product = Product.find_by(id:params[:id])

    carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted"
    )
    carted_product.save
    render json: carted_product

  end

  def destroy
    
    carted_product = CartedProduct.find_by(id: params[:id])
    # carted_product.destroy
    carted_product.update(
      status: "removed"
    )
    render json: {message: "The item removed!"}
  end
    
end
