class Food < ApplicationRecord
    include ActiveModel::Serializers::JSON
    # attr_accessor :converted_amount 
    has_many :pet_foods, :dependent => :destroy
    has_many :pets, through: :pet_foods

    validates :expiration_date, presence: true

    # def quantity 
    #     amount / conversion_rate
    # end

    def quantity_to_amount(quantity)
        # byebugg
        food_quantity = quantity.to_f * conversion_rate
        return amount - food_quantity
    end

    def quantity_removal(quantity_in_pounds)
        amount - quantity_in_pounds
    end
end
