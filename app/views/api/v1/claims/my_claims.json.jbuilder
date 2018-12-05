json.my_claims do
  json.array! @claims do |claim|
    json.id claim.id
    json.user_id claim.user_id
    json.post_id claim.post_id
    json.claimed_at claim.claimed_at
    json.price (claim.post.original_price*claim.post.discount.round(1))
    json.name claim.post.name
    json.cuisine claim.post.restaurant.cuisine
  end
end
