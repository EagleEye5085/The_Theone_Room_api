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
    # binding.pry
    if review.save
      render json: ReviewSerializer.new(review), status: 201
    else
      render status: 404
    end
  end

  def update
    # binding.pry
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

  def recent
    if Review.where("throne_room_id = ?", params[:id]).count > 0
      render json: ReviewSerializer.new(Review.where("throne_room_id = ?", params[:id]).order(created_at: :desc).limit(5))
    else
      render status: 404
    end
  end

  private
  def review_params
    # binding.pry
    params[:review][:ambiance] = params[:review][:ambiance].to_i if params[:review][:ambiance].to_i > 0
    params[:review][:cleanliness] = params[:review][:cleanliness].to_i if params[:review][:cleanliness].to_i > 0
    params[:review][:privacy] = params[:review][:privacy].to_i if params[:review][:privacy].to_i > 0
    params[:review][:tp_quality] = params[:review][:tp_quality].to_i if params[:review][:tp_quality].to_i > 0
    params[:review][:accessibility] = params[:review][:accessibility].to_i if params[:review][:accessibility].to_i > 0
    params[:review][:throne_room_id] = params[:review][:throne_room_id].to_i if params[:review][:throne_room_id].to_i > 0
    params[:review][:user_id] = params[:review][:user_id].to_i if params[:review][:user_id].to_i > 0
    # binding.pry
    params.require(:review).permit(
                            :cleanliness,
                            :ambiance,
                            :tp_quality,
                            :privacy,
                            # :accessibility,
                            :other_comments,
                            :throne_room_id,
                            :user_id)
  end
end