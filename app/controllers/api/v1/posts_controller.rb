class Api::V1::PostsController < Api::V1::BaseController
  def index
    @posts = Post.where("end_day > ?", Time.now)
    if params[:keyword].present?
      sql_query = "name ILIKE :keyword"
      @posts = Post.where(sql_query, keyword: "%#{params[:keyword]}%")
    else
      @posts = Post.where("end_day > ?", Time.now)
    end
  end



  def show
    @post = Post.find(params[:id])
    @restaurant = @post.restaurant
  end
end
