class ProductsController < ApplicationController

  def first_product
    p1 = Product.first

    render json:{first_product: p1}
    
  end

end
