json.restaurant do
  json.extract! @restaurant, :id, :name, :address, :cuisine, :user_id, :phone_number, :rating, :image, :longitude, :latitude

  json.posts do
    json.array! @posts do |post|
      json.id post.id
      json.restaurant post.restaurant.name
      json.name post.name
      json.original_price post.original_price
      json.discount post.discount.round(1)
      json.description post.description
      json.start_time post.start_time.strftime('%H:%M:%S%p')
      json.end_time post.end_time.strftime('%H:%M:%S%p')
      json.image post.image
    end
  end
end
