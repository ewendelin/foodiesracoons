class Api::V1::PostsController < Api::V1::BaseController

 def index
   @posts = Post.all
   # if params[:keyword]
   #   @posts = Post.where(“name = ?“, params[:keyword])
   # end
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
