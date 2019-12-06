class AddConversionRateToFood < ActiveRecord::Migration[6.0]
  def change
    add_column :foods, :conversion_rate, :decimal, :default => 0.231
  end
end
