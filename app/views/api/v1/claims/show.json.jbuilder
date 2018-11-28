json.claim { json.extract! @claim, :post_id, :user_id, :status }
json.post { json.extract! @post, :restaurant_id, :name, :original_price, :discount, :description, :start_time, :end_time, :start_day, :end_day, :image }

json.restaurant { json.extract! @restaurant, :name, :address, :cuisine, :user_id }

