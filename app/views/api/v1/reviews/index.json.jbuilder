json.array! @reviews do |review|
  json.id review.id
  json.rating review.rating
  json.content review.content
end


