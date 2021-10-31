class CartedProductsController < ApplicationController
  def create

    product = Product.find_by(id:params[:id])

    carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: params[:status],
      order_id: params[:order_id]
    )
    carted_product.save
    render json: carted_product

  end
    
end
