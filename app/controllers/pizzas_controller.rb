class PizzasController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_method

    private
    def record_not_found
        render json:{error: "Pizza not found"}
    end
    def unprocessable_entity_method e
        render json: {error: e.record.errors}, status: :unprocessable_entity
    end
end
