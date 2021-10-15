class ProductsController < ApplicationController

  def index

    p_all = Product.all

    render json:p_all.as_json
   
  end

  def show

    product = Product.find_by(id:2)

    the_id = params["id"]

    product = Product.find_by(id:the_id)

    render json:product.as_json

    
  end

end
