json.claim { json.extract! @claim, :id, :post_id, :user_id, :status }

json.claim do
  json.claimed_at @claim.claimed_at.strftime('%e %b %Y %H:%M%p')
end

json.post { json.extract! @post, :id, :restaurant_id, :name, :original_price, :description, :image }

json.post do
  json.discount @post.discount.round(1)
  json.start_time @post.start_time.strftime('%H:%M%p')
  json.end_time @post.end_time.strftime('%H:%M%p')
end

json.restaurant { json.extract! @restaurant, :id, :name, :address, :cuisine, :user_id }
