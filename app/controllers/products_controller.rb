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
    product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      supplier_id: params[:supplier_id]
    )

    if product.save
      render json: product
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
      render json: product
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
