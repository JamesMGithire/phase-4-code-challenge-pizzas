class PizzasController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_method

    def index
        render json: Pizza.all
    end

    def show
        pizza = find_pizza
        render json: pizza
    end

    # def create
    #     pizza = Pizza.create!(pizza_params)
    #     render json: pizza, status: :created
    # end

    # def update
    #     pizza = find_pizza
    #     pizza.update!(pizza_params)
    #     render json: pizza, status: :accepted
    # end

    # def destroy
    #     pizza = find_pizza
    #     pizza.destroy
    #     render json: pizza,status: :no_content
    # end


    private

    def find_pizza
        Pizza.find_by!(id: params[:id])
    end

    def record_not_found
        render json:{error: "Pizza not found"}, status: :not_found
    end
    
    # def pizza_params
    #     params.permit(:name, :ingredients)
    # end

    # def unprocessable_entity_method e
    #     render json: {errors: e.record.errors}, status: :unprocessable_entity
    # end
end
