class MachinerySerializer < ActiveModel::Serializer
  attributes :id, :type, :name, :phone, :price, :min_order, :description

  has_one :user
end
