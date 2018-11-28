class Api::V1::ClaimsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

  def create
    # user = User.find(params[:user_id])
    # @claim = user.claims.new({
    #   post_id: params[:post_id]
    # })
    # @claim.claimed_at = Time.now
    # @post = @claim.post
    # @restaurant = @post.restaurant
    # if @claim.save
    #   render 'show', status: :created
    # else
    #   render_error
    # end
  end

  def show
    @claim = Claim.find(params[:id])
    @post = @claim.post
    @restaurant = @post.restaurant
  end

  def destroy
    @claim = Claim.find(params[:id])
    @claim.destroy
    head :no_content
  end
end
