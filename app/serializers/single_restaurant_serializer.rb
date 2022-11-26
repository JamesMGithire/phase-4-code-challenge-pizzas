class SingleRestaurantSerializer < ActiveModel::Serializer
    attributes :id, :name, :address, :pizzas
end
