require 'faker'




# Create 10 users (id:1-5->seller, id:6-10->buyer)†POst
10.times do
  User.create(
    email: Faker::Internet.email,
    password: '123123',
    first_name: Faker::Internet.username,
    last_name: Faker::Internet.username
  )
end

# Create 5 restaurants
# u for seller
u = 1
array = []
t = Faker::Number.between(3, 10)
5.times do
  t.times do
    array << Faker::Number.between(1, 5)
  end
  Restaurant.create(
    name: Faker::FunnyName.two_word_name,
    address: Faker::Address.full_address,
    cuisine: Faker::Food.ingredient,
    user_id: u,
    phone_number: Faker::PhoneNumber.phone_number,
    rating: array
  )
  u += 1
end

images = ['https://images.pexels.com/photos/6267/menu-restaurant-vintage-table.jpg?auto=compress&cs=tinysrgb&dpr=2&h=350', 'https://images.pexels.com/photos/262978/pexels-photo-262978.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350', 'https://images.pexels.com/photos/696218/pexels-photo-696218.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350', 'https://images.pexels.com/photos/941861/pexels-photo-941861.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350']

r = 36
5.times do
  2.times do
    d = Faker::Number.between(0, 5)
    Post.create(
      restaurant_id: r,
      name: Faker::Food.dish,
      original_price: Faker::Number.between(30, 1000),
      discount: Faker::Number.between(0.3, 0.9),
      description: Faker::Food.description,
      start_time: Faker::Time.forward(0, :afternoon),
      end_time: Faker::Time.forward(0, :evening),
      start_day: Faker::Time.backward(d, :morning),
      end_day: Faker::Time.forward(d, :evening),
      image: images.sample
    )
  end
  r += 1
end

# Create 5 claims
# u2 for buyer
u2 = 1
# pid for post id
pid = 71
5.times do
  Claim.create(
    post_id: pid,
    user_id: u2,
    claimed_at: Faker::Time.backward(10, :evening)
  )
  pid += 1
  u2 += 1
end
