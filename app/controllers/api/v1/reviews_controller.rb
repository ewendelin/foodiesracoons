class Api::V1::ReviewsController < Api::V1::BaseController
  def index
    restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = Review.where("restaurant_id = #{restaurant.id} ")
  end

  def create
  end
end
