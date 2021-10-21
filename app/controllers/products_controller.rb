class ProductsController < ApplicationController

  def index

    p_all = Product.all
    # render json:p_all.as_json(methods:[:is_discounted?,:tax,:total])
    render json:p_all
   
  end

  def show

    # product = Product.find_by(id:2)
    the_id = params["id"]
    product = Product.find_by(id:the_id)
    # render json:product.as_json(methods:[:is_discounted?,:tax,:total])
    render json:product

  end

  def create

    # product = Product.new(name:"IPAD PRO", price:799, image_url:"table.png", description:"it is a cool tablet for sketching your projects professionally")

    product = Product.new(
      name: params[:input_name],
      price: params[:input_price],
      image_url: params[:input_url],
      description: params[:input_description]
    )

    if product.save
      render json: product.as_json
    else
      render json: {errors: product.errors.full_messages}
    end
    
    
  end

  def update
    the_id = params[:id]
    product = Product.find_by(id: the_id)
    
    product.name = params[:name] || product.name
    product.price = params[:price] || product.price
    product.image_url = params[:image_url] || product.image_url
    product.description = params[:description] || product.description

    if product.save
      render json: product.as_json
    else
      render json: {errors: product.errors.full_messages}
    end
    
  end

  def destroy
    
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: product
  end

end
