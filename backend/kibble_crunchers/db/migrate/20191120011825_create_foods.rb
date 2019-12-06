class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :brand
      t.string :name
      t.date :expiration_date
      t.decimal :amount

      t.timestamps
    end
  end
end
