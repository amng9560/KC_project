class PetsController < ApplicationController
    before_action :find_pet, only: [:show, :update, :destroy]
    before_action :find_user, only: [:index]
    #before_action :pet_params, only: [:create, :update]

    def index
        # byebug
        @pets = @owner.pets
        render json: PetSerializer.new(@pets)
    end

    def show 
        render json: PetSerializer.new(@pet)
    end

    def create 
        @pet = Pet.new(pet_params)

        if @pet.valid?
            @pet.save
            render json: PetSerializer.new(@pet)
        else
            render json: {error: "Did not create"}
        end
    end

    def update
        if @pet.update(pet_params)
            render json: @pet
        else 
            render json: {error: "Did not update"}
        end
    end

    def destroy
        @pet.destroy

        render status: 204
    end

    private
    def find_user
        @owner = User.find(params[:user_id])
    end

    def find_pet
        @pet = Pet.find(params[:id])
    end

    def pet_params
        params.require(:pet).permit(:name, :breed, :birth_date, :animaltype, :user_id)
    end
end
