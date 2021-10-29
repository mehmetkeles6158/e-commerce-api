class Category < ApplicationRecord
  has_many :product_categories

  def products
  end
end
