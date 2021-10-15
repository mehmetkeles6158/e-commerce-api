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

  def create

    new_product = Product.new(name:"IPAD PRO", price:799, image_url:"table.png", description:"it is a cool tablet for sketching your projects professionally")

    new_product.save

    render json: new_product.as_json
    
  end

end
