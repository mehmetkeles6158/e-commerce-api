class SuppliersController < ApplicationController
  def index
    supplier_all = Supplier.all
    render json:supplier_all
  end

  def create
    Supplier.new(
      
    )
  end
end
