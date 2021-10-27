class OrderSerializer < ActiveModel::Serializer
  attributes :id, :user, :product
end
