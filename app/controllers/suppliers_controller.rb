class SuppliersController < ApplicationController
  def index
    supplier_all = Supplier.all
    render json:supplier_all
  end

  def show
    the_id = params[:id]
    supplier = Supplier.find_by(id:the_id)
    render json:supplier
  
    
  end

  def create
    supplier = Supplier.new(
      name: params[:name],
      email: params[:email],
      phone_number: params[:phone_number]
    )
    supplier.save
  end

end
