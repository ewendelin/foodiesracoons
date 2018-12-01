require 'faker'

User.destroy_all

# Create 10 users (1-5->seller, 6-10->buyer)
# userid_a for store user's id
userid_a = []
10.times do
  User.create(
    email: Faker::Internet.email,
    password: '123123',
    first_name: Faker::Internet.username,
    last_name: Faker::Internet.username
  )
  userid_a << User.last.id
end

# set variables
address_a = ['Nanjing Road, Shanghai', '218 Anren St, Huangpu, Shanghai', "170 Anyuan Road, Jing'an, Shanghai", '2853 Longhua Rd, Xuhui, Shanghai', '1 Century Ave, Pudong, Shanghai']
cuisine_a = ['Chinese', 'Indian', 'Taiwanese', 'Japanese', 'American']
restaurant_images_a = ['https://images.pexels.com/photos/6267/menu-restaurant-vintage-table.jpg?auto=compress&cs=tinysrgb&dpr=2&h=350', 'https://images.pexels.com/photos/262978/pexels-photo-262978.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350', 'https://images.pexels.com/photos/696218/pexels-photo-696218.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350', 'https://images.pexels.com/photos/941861/pexels-photo-941861.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350', 'https://images.unsplash.com/photo-1517458047551-6766fa5a9362?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=429b01927f1e5fd769f5e8a0fe8fc954&auto=format&fit=crop&w=800&q=60']
post_name_a = ['Steamed dumplings', 'Chicken and rice', 'Curry', 'Pita', 'Beef noodles', 'Braised pork rice', 'Sushi', 'Ramen', 'Burger', 'Salad']
post_images_a = ['https://images.unsplash.com/photo-1523905330026-b8bd1f5f320e?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=90a4f62a13955fd92b02cb3ae8c31b94&auto=format&fit=crop&w=800&q=60', 'https://images.unsplash.com/photo-1525755662778-989d0524087e?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=e83c3040e4103098e34c1ef7b4ce5406&auto=format&fit=crop&w=800&q=60', 'https://images.unsplash.com/photo-1505253758473-96b7015fcd40?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=c5fd7c4cf5b8b0a8042f577e2434fb91&auto=format&fit=crop&w=800&q=60', 'https://images.unsplash.com/photo-1536305030588-45dc07a2a372?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=c79b47cb7a89084df7053f76914a227b&auto=format&fit=crop&w=800&q=60', 'https://images.unsplash.com/photo-1529690678884-189e81f34ef6?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8fa73502eb481f89209ceeb56cec0dbe&auto=format&fit=crop&w=800&q=60', 'https://images.unsplash.com/photo-1534070189982-818bb5622474?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=c107ebf95849c0d471203d3314dfe348&auto=format&fit=crop&w=800&q=60', 'https://images.unsplash.com/photo-1511344407683-b1172dce025f?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=b9e6c31dea9271a9973ff52fe9c8ed92&auto=format&fit=crop&w=800&q=60', 'https://images.unsplash.com/photo-1509680859026-7d8cfc6894f4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=d37b5b1bffd98e717ae399c479c50e5b&auto=format&fit=crop&w=800&q=60', 'https://images.unsplash.com/photo-1512152272829-e3139592d56f?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=db4ad901fa9d778a5878044dc58a29cf&auto=format&fit=crop&w=800&q=60', 'https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=9997040718ac91539eef5f18cbc6c0dd&auto=format&fit=crop&w=800&q=60']
rating_a = []
# r for restaurant number
r = 1

# create
5.times do
  # Create 5 restaurants
  # t for rating for restaurant
  t = Faker::Number.between(3, 10)
  t.times do
    rating_a << Faker::Number.between(1, 5)
  end
  Restaurant.create(
    name: Faker::FunnyName.two_word_name,
    address: address_a[r],
    cuisine: cuisine_a[r],
    user_id: userid_a[r],
    phone_number: Faker::PhoneNumber.phone_number,
    rating: rating_a,
    image: restaurant_images_a[r]
  )

  restaurant_id = Restaurant.last.id

  # create 10 posts
  2.times do
    d = Faker::Number.between(0, 5)
    Post.create(
      restaurant_id: restaurant_id,
      name: post_name_a[r],
      original_price: Faker::Number.between(30, 1000),
      discount: Faker::Number.between(0.3, 0.9).round(1),
      description: Faker::Food.description,
      start_time: Faker::Time.forward(0, :afternoon),
      end_time: Faker::Time.forward(0, :evening),
      everyday: ['yes', 'no'].sample,
      image: post_images_a[r]
    )
    r += 1
  end

  r -= 2

  # Create 5 claims
  post_id = Post.last.id

  Claim.create(
    post_id: post_id,
    user_id: userid_a[r+5],
    claimed_at: Faker::Time.backward(10, :evening)
  )

  r += 1
end


# d = Faker::Number.between(0, 5)
# Post.create(
#       restaurant_id: 1,
#       name: "burger",
#       original_price: Faker::Number.between(30, 1000),
#       discount: Faker::Number.between(0.3, 0.9),
#       description: "smell really good",
#       start_time: Faker::Time.forward(0, :afternoon),
#       end_time: Faker::Time.forward(0, :evening),
#       start_day: Faker::Time.backward(d, :morning),
#       end_day: Faker::Time.forward(d, :evening),
#       image: "https://images.unsplash.com/photo-1428660386617-8d277e7deaf2?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=d85cfa1d6d003f6e82f46bc5a394a592&auto=format&fit=crop&w=1867&q=80"
# )

# r = 1
# 5.times do
#   2.times do
#     d = Faker::Number.between(0, 5)
#     Post.create(
#       restaurant_id: r,
#       name: Faker::Food.dish,
#       original_price: Faker::Number.between(30, 1000),
#       discount: Faker::Number.between(0.3, 0.9),
#       description: Faker::Food.description,
#       start_time: Faker::Time.forward(0, :afternoon),
#       end_time: Faker::Time.forward(0, :evening),
#       everyday_day: ['yes', 'no'].sample,
#       image: images.sample
#     )
#   end
#   r += 1
# end

# Create 5 claims
# # u2 for buyer
# u2 = 1
# # pid for post id
# pid = 71
# 5.times do
#   Claim.create(
#     post_id: pid,
#     user_id: u2,
#     claimed_at: Faker::Time.backward(10, :evening)
#   )
#   pid += 1
#   u2 += 1
# end
