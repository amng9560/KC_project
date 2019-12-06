class FoodsController < ApplicationController
    before_action :find_food, only: [:show, :update, :destroy]
    def index
        @foods = Food.all
        render json: @foods
    end

    def show 
        render json: @food
    end

    def create 
        @food = Food.new(food_params)

        if @food.valid?
            @food.save 

            PetFood.create({
                pet_id: params[:pet_id],
                food_id: @food.id
            })

            render json: @food
        else 
            render json: {error: "Did not create"}
        end
    end

    def update
        if @food.update({amount: @food.quantity_to_amount(params[:amount][:cup_quantity])})
            render json: @food
        else 
            render json: {error: "Did not update"}
        end
    end

    def destroy
        @food.destroy


        render status: 204
    end

    private
    def find_food
        @food = Food.find(params[:id])
    end
    
    def food_params
        params.require(:food).permit(:brand, :name, :expiration_date, :amount)
    end
end
