class AddRatingToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :rating, :integer, array: true, default: []
  end
end
