class SalesSummariesController < ApplicationController
  # RESTful
  before_action :set_sales_summary, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index]
  before_action :admin_user, only: [:index]
  before_action :correct_user, only: [:new, :create, :show, :edit, :update, :destroy]

  # GET /sales_summaries
  # GET /sales_summaries.json
  def index
    @sales_summaries = SalesSummary.all
  end

  # GET /sales_summaries/1
  # GET /sales_summaries/1.json
  def show
    if params[:date].present?
      month = params[:date][:month]
      year = params[:date][:year]
      sales_summary = SalesSummary.find(params[:id])
      @sales_summary = SalesSummary.where(month: month, year: year, tasting_room: sales_summary.tasting_room ).first
    else #if params[:id].present?
      @sales_summary = SalesSummary.find(params[:id])
    end

    if @sales_summary.blank?
      date = Date.new(year.to_i, month.to_i)
      if date <= Date.today
        redirect_to new_sales_summary_path(year: year, month: month, tasting_room: sales_summary.tasting_room)
      else
        redirect_to :back, notice: "Month not available yet"
      end
    else #not blank
      @tasting_room = @sales_summary.tasting_room
      if params[:commit].present? && params[:commit] == 'Edit'
        redirect_to edit_sales_summary_path(@sales_summary)
      end
    end
  end

  # GET /sales_summaries/new
  def new
    @sales_summary = SalesSummary.new
    @tasting_room = TastingRoom.find(params[:tasting_room]) if params[:tasting_room].present?
    if params[:year].present? && params[:month].present?
      @sales_summary.month = params[:month]
      @sales_summary.year = params[:year]
    else
      m = Date.today.month - 1
      m = 1 if m == 0
      @sales_summary.month = m
      @sales_summary.year = Date.today.year
    end
  end

  # GET /sales_summaries/1/edit
  def edit
    @tasting_room = TastingRoom.find(params[:tasting_room]) if params[:tasting_room].present?
  end

  # POST /sales_summaries
  # POST /sales_summaries.json
  def create
    @sales_summary = SalesSummary.new(sales_summary_params)

    respond_to do |format|
      if @sales_summary.save
        format.html { redirect_to @sales_summary, notice: 'Sales summary was successfully created.' }
        format.json { render :show, status: :created, location: @sales_summary }
      else
        format.html { render :new }
        format.json { render json: @sales_summary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales_summaries/1
  # PATCH/PUT /sales_summaries/1.json
  def update
    respond_to do |format|
      if @sales_summary.update(sales_summary_params)
        format.html { redirect_to @sales_summary, notice: 'Sales summary was successfully updated.' }
        format.json { render :show, status: :ok, location: @sales_summary }
      else
        format.html { render :edit }
        format.json { render json: @sales_summary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales_summaries/1
  # DELETE /sales_summaries/1.json
  def destroy
    @sales_summary.destroy
    respond_to do |format|
      format.html { redirect_to :back || sales_summaries_url, notice: 'Sales summary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def get_params

    end
    def correct_user
      #debugger
      if current_user.admin?
        #good to go
      elsif @sales_summary.present? && @sales_summary.winery.users.include?(current_user)

      elsif params[:tasting_room].present?
        @tasting_room = TastingRoom.find(params[:tasting_room])
        redirect_back(fallback_location: root_url) if !@tasting_room.winery.users.include?(current_user)
      elsif params[:sales_summary].present? && params[:sales_summary][:tasting_room_id].present?
        @tasting_room = TastingRoom.find(params[:sales_summary][:tasting_room_id])
        redirect_back(fallback_location: root_url) if !@tasting_room.winery.users.include?(current_user)
      else
        redirect_back(fallback_location: root_url)
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_sales_summary
      @sales_summary = SalesSummary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sales_summary_params
      params.require(:sales_summary).permit(:tasting_room_id, :num_of_tasters, :num_of_purchasers, :num_of_club_signups, :sales_in_dollars, :year, :month, :day)
    end
end
