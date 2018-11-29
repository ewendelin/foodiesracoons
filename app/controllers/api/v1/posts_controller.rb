class Api::V1::PostsController < Api::V1::BaseController
  def index
    @posts = Post.where("end_day > ?", Time.now)
    if params[:keyword]
      @posts = Post.where("name = ?", params[:keyword])
  end

  def show
    @post = Post.find(params[:id])
    @restaurant = @post.restaurant
  end
end
