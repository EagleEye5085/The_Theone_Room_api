class Api::V1::ThroneRoomsController < ApplicationController

  def index
    # @thrones = ThroneRoom.close_to(address)
    render json: ThroneRoomSerializer.new(ThroneRoom.all)
  end

  def top_five_by_review
    render json: ThroneRoomSerializer.new(ThroneRoom.top_five_by_review)
  end

  def top_five_buy_user
    render json: ThroneRoomSerializer.new(ThroneRoom.top_five_buy_user)
  end

  def closest_five
    render json: ThroneRoomSerializer.new(ThroneRoom.near(Geocoder.search(request.remote_ip).first.coordinates, 99999).limit(5))
  end

  def show
    if ThroneRoom.exists?(params[:id])
      render json: ThroneRoomSerializer.new(ThroneRoom.find(params[:id]))
    else
      render json: {
        error: 'Throne Room not available'
        }, status: 404
    end
  end

  def create
    throne_room = ThroneRoom.new(throne_room_params)
    if throne_room.save
      render json: ThroneRoomSerializer.new(throne_room), status: 201
    else
      render status: 404
    end
  end

  def update
    throne_room = ThroneRoom.find(params[:id])
    if throne_room.update(throne_room_params)
      render json: ThroneRoomSerializer.new(ThroneRoom.find(params[:id])), status: :accepted
    else
      render status: 404
    end
  end

  def destroy
    if ThroneRoom.exists?(params[:id])
      ThroneRoom.destroy(params[:id])
    else
      render status: 404
    end
  end

  private
  def throne_room_params
    params[:throne_room][:baby_changing_station] = params[:throne_room][:baby_changing_station].to_i
    params[:throne_room][:key_code_required] = params[:throne_room][:key_code_required].to_i
    params[:throne_room].permit(:name, :address, :latitude, :longitude,:directions, :baby_changing_station, :bathroom_style, :key_code_required)
  end
end
