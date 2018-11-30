# get post
json.post { json.extract! @post, :id, :restaurant_id, :name, :original_price, :description,:image }

json.post do
  json.discount @post.discount.round(1)
  json.start_time @post.start_time.strftime('%H:%M%p')
  json.end_time @post.end_time.strftime('%H:%M%p')
  json.start_day @post.start_day.strftime('%e %b %Y')
  json.end_day @post.end_day.strftime('%e %b %Y')
end

# get restaurant
json.restaurant { json.extract! @restaurant, :id, :name, :address, :cuisine, :user_id, :phone_number }
