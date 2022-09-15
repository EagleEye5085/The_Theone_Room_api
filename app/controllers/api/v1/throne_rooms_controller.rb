class Api::V1::ThroneRoomsController < ApplicationController

  def index
    render json: ThroneRoomSerializer.new(ThroneRoom.all)
  end

  def show
    render json: ThroneRoomSerializer.new(ThroneRoom.find(params[:id]))
  end

  def create
    render json: ThroneRoomSerializer.new(throne_room_params), status: :created
  end

  def update
    ThroneRoom.find(params[:id]).update(throne_room_params)
    render json: ThroneRoomSerializer.new(ThroneRoom.find(params[:id])), status: :accepted
  end

  def destroy
    render json: ThroneRoomSerializer.new(ThroneRoom.find(params[:id]))
    ThroneRoom.find(params[:id]).destroy
  end

  private
  def throne_room_params
    params(:name, :address, :latitude, :longitude,:directions, :baby_changing_station, :bathroom_style, :key_code_required)
  end
end
