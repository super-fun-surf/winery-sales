class SalesSummariesController < ApplicationController
  before_action :set_sales_summary, only: [:show, :edit, :update, :destroy]

  # GET /sales_summaries
  # GET /sales_summaries.json
  def index
    @sales_summaries = SalesSummary.all
  end

  # GET /sales_summaries/1
  # GET /sales_summaries/1.json
  def show
  end

  # GET /sales_summaries/new
  def new
    @sales_summary = SalesSummary.new
    @sales_summary.month = Date.today.month
    @sales_summary.year = Date.today.year
  end

  # GET /sales_summaries/1/edit
  def edit
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
      format.html { redirect_to sales_summaries_url, notice: 'Sales summary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sales_summary
      @sales_summary = SalesSummary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sales_summary_params
      params.require(:sales_summary).permit(:tasting_room_id, :num_of_tasters, :num_of_purchasers, :num_of_club_signups, :sales_in_dollars, :year, :month, :day)
    end
end
