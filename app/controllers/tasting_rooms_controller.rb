class TastingRoomsController < ApplicationController
  before_action :set_tasting_room, only: [:show, :edit, :update, :destroy]

  # GET /tasting_rooms
  # GET /tasting_rooms.json
  def index
    @tasting_rooms = TastingRoom.all
  end

  # GET /tasting_rooms/1
  # GET /tasting_rooms/1.json
  def show
  end

  # GET /tasting_rooms/new
  def new
    @tasting_room = TastingRoom.new
  end

  # GET /tasting_rooms/1/edit
  def edit
  end

  # POST /tasting_rooms
  # POST /tasting_rooms.json
  def create
    @tasting_room = TastingRoom.new(tasting_room_params)

    respond_to do |format|
      if @tasting_room.save
        format.html { redirect_to @tasting_room, notice: 'Tasting room was successfully created.' }
        format.json { render :show, status: :created, location: @tasting_room }
      else
        format.html { render :new }
        format.json { render json: @tasting_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasting_rooms/1
  # PATCH/PUT /tasting_rooms/1.json
  def update
    respond_to do |format|
      if @tasting_room.update(tasting_room_params)
        format.html { redirect_to @tasting_room, notice: 'Tasting room was successfully updated.' }
        format.json { render :show, status: :ok, location: @tasting_room }
      else
        format.html { render :edit }
        format.json { render json: @tasting_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasting_rooms/1
  # DELETE /tasting_rooms/1.json
  def destroy
    @tasting_room.destroy
    respond_to do |format|
      format.html { redirect_to tasting_rooms_url, notice: 'Tasting room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tasting_room
      @tasting_room = TastingRoom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tasting_room_params
      params.require(:tasting_room).permit(:name, :region_id, :winery_id, :year_established, :num_of_employees, :profile_image, :estate)
    end
end
