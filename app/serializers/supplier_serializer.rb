class SupplierSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone_number
  has_many :products
end
