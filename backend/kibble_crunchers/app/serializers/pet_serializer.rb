class PetSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :breed, :birth_date, :animaltype, :foods
end