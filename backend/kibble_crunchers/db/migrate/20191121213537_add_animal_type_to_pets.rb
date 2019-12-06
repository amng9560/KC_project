class AddAnimalTypeToPets < ActiveRecord::Migration[6.0]
  def change
    add_column :pets, :animaltype, :string
  end
end
