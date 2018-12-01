class AddLatitudetoRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :latitude, :decimal
  end
end
