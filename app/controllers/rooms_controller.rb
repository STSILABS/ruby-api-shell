class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :update, :destroy]

  # GET /rooms
  def index
    @rooms = Room.all
    json_response(@rooms)
  end

  # POST /rooms
  def create
    @room = Room.create!(room_params)
    json_response(@room, :created)
  end

  # GET /rooms/:id
  def show
    json_response(@room)
  end

  # PUT /rooms/:id
  def update
    @room.update(room_params)
    head :no_content
  end

  # DELETE /rooms/:id
  def destroy
    @room.destroy
    head :no_content
  end

  private

  def room_params
    # whitelist params
    params.permit(:title, :capacity, :building)
  end

  def set_room
    @room = Room.find(params[:id])
  end
end
