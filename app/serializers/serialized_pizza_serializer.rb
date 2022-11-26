class SerializedPizzaSerializer < ActiveModel::Serializer
  attributes :id, :name, :ingredients
end
