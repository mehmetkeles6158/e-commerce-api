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

    product = Product.new(name:"IPAD PRO", price:799, image_url:"table.png", description:"it is a cool tablet for sketching your projects professionally")

    product = Product.new(
      name: params[:input_name],
      price: params[:input_price],
      image_url: params[:input_url],
      description: params[:input_description]
    )

    product.save

    render json: product.as_json
    
  end

  def update
    the_id = params[:id]
    product = Product.find_by(id: the_id)
    
    # product.name = "Macbook Pro"
    # product.price = 1199
    # product.image_url = "macbookpro.png"
    # product.description = "It is good laptop for programming"

    product.name = params[:name]
    product.price = params[:price]
    product.image_url = params[:image_url]
    product.description = params[:description]
    product.save

    render json: product.as_json
    
  end

end
