class Product < ApplicationRecord

  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products
  


  validates :name, presence: true
  validates :price, numericality: {greater_than: 0}
  validates :description, length: { in: 10..500}
  validates :name, uniqueness: true


  def is_discounted?

    if price < 10
      return true
    else
      return false
    end

  end

  def tax
    price * 0.09
  end

  def total
    price + tax
    p "This product' price is $#{ price + tax} including tax!"
  end


end

