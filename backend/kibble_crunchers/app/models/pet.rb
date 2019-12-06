class Pet < ApplicationRecord
    has_many :pet_foods
    has_many :foods, through: :pet_foods
    belongs_to :user

    validates :name, :breed, presence: true
    validates :birth_date, presence: true
end
