class Api::V1::ReviewsController < Api::V1::BaseController
  def index
    restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = Review.where("restaurant_id = #{restaurant.id} ")
    @users = []
  end

  def create
    user = User.find(params[:user_id])
    @review = user.reviews.new(review_params)
    @review.restaurant = Restaurant.find(params[:restaurant_id])

    if @review.save
      render 'index', status: :created
    else
      render_error
    end
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
