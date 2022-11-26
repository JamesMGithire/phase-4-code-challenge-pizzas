class RestaurantPizza < ApplicationRecord
    validate :price_range
    def price_range
        if(price>30 && price < 1)
            errors.add(:price, "must be between 30 and 1")
        end
    end

end
