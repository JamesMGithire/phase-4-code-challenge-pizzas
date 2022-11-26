# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Restaurant.destroy_all
Pizza.destroy_all
RestaurantPizza.destroy_all

5.times do
    Restaurant.create(name:Faker::Restaurant.name, address: "#{Faker::Address.full_address}")
end

5.times do
    ing = []
    3.times{ing << Faker::Food.ingredient}
    Pizza.create(name: ing[-1], ingredients:  ing.join(", "))
end

RestaurantPizza.create(restaurant_id: 1, pizza_id: 1, price: rand(1..30))
RestaurantPizza.create(restaurant_id: 1, pizza_id: 2, price: rand(1..30))
RestaurantPizza.create(restaurant_id: 2, pizza_id: 2, price: rand(1..30))
RestaurantPizza.create(restaurant_id: 3, pizza_id: 2, price: rand(1..30))
RestaurantPizza.create(restaurant_id: 3, pizza_id: 3, price: rand(1..30))
RestaurantPizza.create(restaurant_id: 4, pizza_id: 4, price: rand(1..30))