class ProductsController < ApplicationController

  def first_product
    p1 = Product.first

    render json:p1.as_json
    
  end

  def second_product

    p2 = Product.find_by(id:2)

    render json:p2.as_json
    
  end

end
