class WineriesController < ApplicationController
  before_action :set_winery, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index]
  before_action :admin_user, only: [:index]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  # GET /wineries
  # GET /wineries.json
  def index
    @wineries = Winery.order(name: :asc)
    respond_to do |format|
      format.html
      format.csv  {
        if params[:date].present?
          month = params[:date][:month]
          year = params[:date][:year]
        else
          month = Date.today.month
          year = Date.today.year
        end
        send_data @wineries.as_csv(month, year),
                :type => 'text/csv',
                :filename => "Winery_Summary_" + month.to_s + '_' + year.to_s + '.csv',
                :disposition => 'attachment' }
    end
  end

  # GET /wineries/1
  # GET /wineries/1.json
  def show
    if @winery.tasting_rooms.count == 1
      redirect_to @winery.tasting_rooms.first
    end
  end

  # GET /wineries/new
  def new
    @winery = Winery.new
  end

  # GET /wineries/1/edit
  def edit
  end

  # POST /wineries
  # POST /wineries.json
  def create

    @winery = Winery.new(winery_params)

    respond_to do |format|
      if @winery.save
        if params[:user].present?
          WineryUser.create(user_id: params[:user], winery_id: @winery.id)
        end
        #format.html { redirect_to @winery, notice: 'Winery was successfully created.' }
        format.html { redirect_to new_tasting_room_path(winery: @winery), notice: 'Winery was successfully created. Now Create a Tasting Room.' }
        format.json { render :show, status: :created, location: @winery }
      else
        format.html { render :new }
        format.json { render json: @winery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wineries/1
  # PATCH/PUT /wineries/1.json
  def update
    respond_to do |format|
      if @winery.update(winery_params)
        format.html { redirect_to @winery, notice: 'Yahoo! You created a new Winery.' }
        format.json { render :show, status: :ok, location: @winery }
      else
        format.html { render :edit }
        format.json { render json: @winery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wineries/1
  # DELETE /wineries/1.json
  def destroy
    @winery.destroy
    respond_to do |format|
      format.html { redirect_to wineries_url, notice: 'Winery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def correct_user
      if current_user.admin?
        #good to go
      elsif @winery.users.include?(current_user)

      else
        redirect_back(fallback_location: root_url)
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_winery
      @winery = Winery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def winery_params
      params.require(:winery).permit(:name, :region_id, :year_established, :num_of_employees, :profile_image,
      :estate, :reminder_days, :cases_sold_2015, :wine_club_members)
    end
end
