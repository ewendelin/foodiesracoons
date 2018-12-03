json.array! @reviews do |review|
  json.id review.id
  json.rating review.rating
  json.content review.content
  json.created_at review.created_at
  json.first_name review.user.first_name
  json.last_name review.user.last_name
end


