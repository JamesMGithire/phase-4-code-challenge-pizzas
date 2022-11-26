class RestaurantPizzaSerializer < ActiveModel::Serializer
  attributes :id,  :pizza_id, :restaurant_id
  belongs_to :pizza
  belongs_to :restaurant
end
