class Api::V1::RestaurantsController < Api::V1::BaseController
  def index
    post = Post.find(params[:post_id])
    @restaurant = Restaurant.find_by(id: post.restaurant_id)
    @rating = @restaurant.rating.map { |r| r.to_i }
    @posts = @restaurant.posts
  end
end
