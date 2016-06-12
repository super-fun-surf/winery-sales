class TastingRoomsController < ApplicationController
  before_action :set_tasting_room, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index]
  before_action :admin_user, only: [:index]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  include ActionView::Helpers::NumberHelper

  # GET /tasting_rooms
  # GET /tasting_rooms.json
  def index
    @tasting_rooms = TastingRoom.all
  end

  # GET /tasting_rooms/1
  # GET /tasting_rooms/1.json
  def show

    #@start_time_this_year = Date.today.beginning_of_year
    if @tasting_room.sales_summaries.blank?
      redirect_to new_sales_summary_path(tasting_room: @tasting_room, month: Date.today.month - 1 , year: Date.today.year)
    end
    @end_month = Date.today.month - 1
    @you = Array.new
    @you_formatted = []
    @them = []
    @them_formatted = []
    for i in 1..@end_month do
      sales_you = @tasting_room.sales_summaries_this_year.where(month: i).first
      if sales_you.present?
        if params[:tasters].present?
          @you[i] = sales_you.num_of_tasters
          @you_formatted[i] = sales_you.num_of_tasters.to_s
        elsif params[:purchasers].present?
          @you[i] = sales_you.num_of_purchasers
          @you_formatted[i] = sales_you.num_of_purchasers.to_s
        elsif params[:sales].present?
          @you[i] = sales_you.sales_in_dollars
          @you_formatted[i] = number_to_currency sales_you.sales_in_dollars
        elsif params[:club_signup].present?
          @you[i] = sales_you.num_of_club_signups
          @you_formatted[i] = sales_you.num_of_club_signups
        elsif params[:conversion].present?
          @you[i] = sales_you.percent_tasters_purcahased
          @you_formatted[i] = number_to_percentage sales_you.percent_tasters_purcahased, precision: 2
        elsif params[:club_conversion].present?
          @you[i] = sales_you.percent_club_signup
          @you_formatted[i] = number_to_percentage sales_you.percent_club_signup, precision: 2
        elsif params[:sales_per_taster].present?
          @you[i] = sales_you.sales_per_taster
          @you_formatted[i] = number_to_currency sales_you.sales_per_taster
        elsif params[:sales_per_purchase].present?
          @you[i] = sales_you.sales_per_purchase
          @you_formatted[i] = number_to_currency sales_you.sales_per_purchase
        else
          @you[i] = sales_you.num_of_tasters
          @you_formatted[i] = sales_you.num_of_tasters.to_s
        end
      else
        @you[i] = 0.0
      end
      if params[:tasters].present?
        @them[i] = @tasting_room.region.avg_tasters(i, Date.today.year)
        @them_formatted[i] = @them[i]
      elsif params[:purchasers].present?
        @them[i] = @tasting_room.region.avg_purchasers(i, Date.today.year)
        @them_formatted[i] = @them[i]
      elsif params[:club_signup].present?
        @them[i] = @tasting_room.region.avg_club_signups(i, Date.today.year)
        @them_formatted[i] = @them[i]
      elsif params[:conversion].present?
        @them[i] = @tasting_room.region.avg_tasters_purchased(i, Date.today.year)
        @them_formatted[i] = number_to_percentage @them[i], precision: 2
      elsif params[:club_conversion].present?
        @them[i] = @tasting_room.region.avg_club_conversion(i, Date.today.year)
        @them_formatted[i] = number_to_percentage @them[i], precision: 2
      elsif params[:sales_per_taster].present?
        @them[i] = @tasting_room.region.avg_sales_per_taster(i, Date.today.year)
        @them_formatted[i] = number_to_currency @them[i]
      elsif params[:sales_per_purchase].present?
        @them[i] = @tasting_room.region.avg_sales_per_purchase(i, Date.today.year)
        @them_formatted[i] = number_to_currency @them[i]
      elsif params[:sales].present?
        @them[i] = @tasting_room.region.avg_sales_in_dollars(i, Date.today.year)
        @them_formatted[i] = number_to_currency @them[i]
      else
        @them[i] = @tasting_room.region.avg_tasters(i, Date.today.year)
        @them_formatted[i] = @them[i]
        params[:tasters] = true
      end

     end
    respond_to do |format|
      format.html
      format.csv { send_data @tasting_room.as_csv,
                :type => 'text/csv',
                :filename => @tasting_room.winery.name + '-' + @tasting_room.region.name + '.csv',
                :disposition => 'attachment' }
    end
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
    def correct_user
      if current_user.admin?
        #good to go
      elsif @tasting_room.winery.users.include?(current_user)

      else
        redirect_back(fallback_location: root_url)
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_tasting_room
      @tasting_room = TastingRoom.find(params[:id])
      @winery = @tasting_room.winery if @tasting_room.winery.present?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tasting_room_params
      params.require(:tasting_room).permit(:name, :region_id, :winery_id, :year_established, :num_of_employees,
      :profile_image, :estate, :tasting_fee, :non_wine_sales_percent_of_room, :seated_tastings)
    end
end
