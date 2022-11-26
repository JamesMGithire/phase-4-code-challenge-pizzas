class RestaurantPizza < ApplicationRecord
    validates :pizza_id, presence: true
    validates :restaurant_id, presence: true
    validate :price_range

    belongs_to :pizza
    belongs_to :restaurant


    def price_range
        if !price.nil?
            if(price>30 && price < 1)
                errors.add(:price, "must be between 30 and 1")
            end
        else
            errors.add(:price, "must be between 30 and 1")
        end
    end

end
