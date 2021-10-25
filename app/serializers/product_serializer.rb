class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :description, :is_discounted?, :tax, :total, :supplier, :images

  # has_many :images
  # belongs_to :supplier

end
