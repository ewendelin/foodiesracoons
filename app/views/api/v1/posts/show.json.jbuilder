# get post
json.post { json.extract! @post, :id, :restaurant_id, :name, :original_price, :discount, :description, :start_time, :end_time, :start_day, :end_day, :image }

# get restaurant
json.restaurant { json.extract! @restaurant, :id, :name, :address, :cuisine, :user_id, :phone_number }
