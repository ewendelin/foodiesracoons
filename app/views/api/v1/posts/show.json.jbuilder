# get post
json.post { json.extract! @post, :id, :restaurant_id, :name, :original_price, :description,:image }

json.post do
  json.discount @post.discount.round(1)
  json.start_time @post.start_time.in_time_zone("Beijing").strftime('%H:%M')
  json.end_time @post.end_time.in_time_zone("Beijing").strftime('%H:%M')
end

# get restaurant
json.restaurant { json.extract! @restaurant, :id, :name, :address, :cuisine, :user_id, :image, :phone_number, :longitude, :latitude }
