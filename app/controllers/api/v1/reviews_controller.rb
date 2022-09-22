class Api::V1::ReviewsController < ApplicationController
    def index
        render json: ReviewSerializer.new(Review.all)
    end

    def show
    if Review.exists?(params[:id])
      render json: ReviewSerializer.new(Review.find(params[:id]))
    else
      render json: {
        error: 'Review not available'
      }, status: 404
    end
  end

  def create
    review = Review.new(review_params)
    if review.save
      render json: ReviewSerializer.new(review), status: 201
    else
      render status: 404
    end
  end

  def update
    review = Review.find(params[:id])
    if review.update(review_params)
      render json: ReviewSerializer.new(Review.find(params[:id]))
    else
      render status: 404
    end
  end

  def destroy
    if Review.exists?(params[:id])
      Review.destroy(params[:id])
    else
      render status: 404
    end
  end

  private
  def review_params
    params.require(:review).permit(
                            :cleanliness,
                            :ambiance,
                            :tp_quality,
                            :privacy,
                            :accessibility,
                            :other_comments,
                            :throne_room_id,
                            :user_id)
  end
end
