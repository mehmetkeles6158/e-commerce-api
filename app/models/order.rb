class Order < ApplicationRecord
  has_many :carted_products
  has_many :products, through: :carted_products
  
  belongs_to :user


  # validates :quantity, numericality: {greater_than: 0}

end
