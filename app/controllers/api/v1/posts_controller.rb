class Api::V1::PostsController < Api::V1::BaseController

  def index
    # @posts = Post.where("end_day > ?", Time.now)
    @posts = Post.all
    if params[:keyword].present?
      sql_query = "name ILIKE :keyword"
      @posts = Post.where(sql_query, keyword: "%#{params[:keyword]}%")
    else
      # @posts = Post.where("end_day > ?", Time.now)
      @posts = Post.all
    end
  end

  def create
    # byebug
    # @claim = user.claims.new({
    #   post_id: params[:post_id]
    # })
    # @claim.claimed_at = Time.now
    @post = Post.new(params[:id])
    # @restaurant = @post.restaurant
    if @post.save
      render ‘index’, status: :created
    else
      render_error
    end
  end

  def show
    @post = Post.find(params[:id])
    @restaurant = @post.restaurant
  end
end
