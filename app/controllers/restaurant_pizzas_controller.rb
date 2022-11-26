class RestaurantPizzasController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_method
    
    def create
        restaurant_pizza = RestaurantPizza.create!(restaurant_pizza_params)
        render json: restaurant_pizza, status: :created
    end
    
    # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    
    # def index
    #     render json: RestaurantPizza.all
    # end

    # def show
    #     restaurant_pizza = find_restaurant_pizza
    #     render json: restaurant_pizza
    # end
    
    
    # def destroy
    #     restaurant_pizza = find_restaurant_pizza
    #     restaurant_pizza.destroy
    #     render json:restaurant_pizza, status: :no_content
    # end
    
    # def update
    #     restaurant_pizza = find_restaurant_pizza
    #     restaurant_pizza.update!(restaurant_pizza_params)
    #     render json: restaurant_pizza, status: :accepted
    # end

    private
    
    def restaurant_pizza_params
        params.permit(:price, :pizza_id, :restaurant_id)
    end
    
    def unprocessable_entity_method e
        render json: {errors: e.record.errors}, status: :unprocessable_entity
    end
    
    def find_restaurant_pizza
        RestaurantPizza.find_by!(id: params[:id])
    end
    
    def record_not_found
        render json:{error: "RestaurantPizza not found"}, status: :not_found
    end
end
