class Api::V1::PostsController < Api::V1::BaseController
  def index
    @posts = Post.where("end_day > ?", Time.now)
  end

  def show
    @post = Post.find(params[:id])
    @restaurant = @post.restaurant
  end
end
