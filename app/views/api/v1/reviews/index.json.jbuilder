json.array! @reviews do |review|
  json.id review.id
  json.rating review.rating
  json.content review.content
  json.created_at review.created_at
  json.avatar_url review.avatar_url
  json.nickname review.nickname
  json.image review.image
end


