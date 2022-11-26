class RestaurantsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_method
    def index
        render json: Restaurant.all
    end

    def show
        restaurant = find_restaurant
        render json: restaurant, serializer: SingleRestaurantSerializer
    end

    def create
        restaurant = Restaurant.create!(restaurant_params)
        render json: restaurant, status: :created
    end

    def update
        restaurant = find_restaurant
        restaurant.update!(restaurant_params)
        render json: restaurant, status: :accepted
    end

    def destroy
        restaurant = find_restaurant
        restaurant.destroy
        render json: restaurant,status: :no_content
    end

    private

    def find_restaurant
        Restaurant.find_by!(id: params[:id])
    end

    def restaurant_params
        params.permit(:name, :ingredients)
    end
    
    private
    def record_not_found
        render json:{error: "Restaurant not found"}, status: :not_found
    end

    def unprocessable_entity_method e
        render json: {errors: e.record.errors}, status: :unprocessable_entity
    end
end
