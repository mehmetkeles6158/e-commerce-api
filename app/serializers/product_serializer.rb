class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :description, :is_discounted?, :tax, :total

  has_many :images
  belongs_to :supplier
  has_many :orders

  # attributes :id, :name, :price, :description

  # has_many :images
  # belongs_to :supplier

end
