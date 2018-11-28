class Api::V1::ClaimsController < Api::V1::BaseController
  def create
    @claim = Claim.new(claim_params)
    @claim.user = @user
    if @claim.save
      render 'show'
    else
      render_error
    end
  end

  def show
    @claim = Claim.find(params[:id])
  end

  def destroy
    @claim = Claim.find(params[:id])
    @claim.destroy
    head :no_content
  end

  def claim_params
    params.require(:claim).permit(:post_id, :user_id, :status, :start_time, :end_time)
  end
end
