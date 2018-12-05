json.my_claims do
  json.array! @claims do |claim|
    json.id claim.id
    json.user_id claim.user_id
    json.post_id claim.post_id
    json.claimed_at claim.claimed_at.in_time_zone("Beijing").strftime('%B%e %H:%M')
    json.price (claim.post.original_price*claim.post.discount.round(1)).round(0)
    json.dish claim.post.name
    json.restaurant claim.post.restaurant
    json.post claim.post
    json.end_time claim.post.end_time.in_time_zone("Beijing").strftime('%B%e %H:%M')
  end
end
