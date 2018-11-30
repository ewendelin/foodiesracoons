json.claim { json.extract! @claim, :id, :post_id, :user_id, :status, :claimed_at }
json.post { json.extract! @post, :id, :restaurant_id, :name, :original_price, :discount, :description, :start_time, :end_time, :start_day, :end_day, :image }

json.restaurant { json.extract! @restaurant, :id, :name, :address, :cuisine, :user_id }
