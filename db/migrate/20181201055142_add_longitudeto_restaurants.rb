class AddLongitudetoRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :longitude, :decimal
  end
end
