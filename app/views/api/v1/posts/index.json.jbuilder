json.posts do
  json.array! @posts.reverse do |post|
    json.id post.id
    json.restaurant post.restaurant.name
    json.longitude post.restaurant.longitude
    json.latitude post.restaurant.latitude
    json.name post.name
    json.original_price post.original_price
    json.discount post.discount.round(1)
    json.description post.description
    json.start_time post.start_time.strftime('%H:%M:%S%p')
    json.end_time post.end_time.strftime('%H:%M:%S%p')
    json.image post.image
  end
end
