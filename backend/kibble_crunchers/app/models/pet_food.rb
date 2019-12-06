class PetFood < ApplicationRecord
  belongs_to :pet
  belongs_to :food
end
