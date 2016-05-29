class WineryUsersController < ApplicationController
  before_action :set_winery_user, only: [:show, :edit, :update, :destroy]

  # GET /winery_users
  # GET /winery_users.json
  def index
    @winery_users = WineryUser.all
  end

  # GET /winery_users/1
  # GET /winery_users/1.json
  def show
  end

  # GET /winery_users/new
  def new
    @winery_user = WineryUser.new
  end

  # GET /winery_users/1/edit
  def edit
  end

  # POST /winery_users
  # POST /winery_users.json
  def create
    @winery_user = WineryUser.new(winery_user_params)

    respond_to do |format|
      if @winery_user.save
        format.html { redirect_to @winery_user, notice: 'Winery user was successfully created.' }
        format.json { render :show, status: :created, location: @winery_user }
      else
        format.html { render :new }
        format.json { render json: @winery_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /winery_users/1
  # PATCH/PUT /winery_users/1.json
  def update
    respond_to do |format|
      if @winery_user.update(winery_user_params)
        format.html { redirect_to @winery_user, notice: 'Winery user was successfully updated.' }
        format.json { render :show, status: :ok, location: @winery_user }
      else
        format.html { render :edit }
        format.json { render json: @winery_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /winery_users/1
  # DELETE /winery_users/1.json
  def destroy
    @winery_user.destroy
    respond_to do |format|
      format.html { redirect_to winery_users_url, notice: 'Winery user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_winery_user
      @winery_user = WineryUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def winery_user_params
      params.require(:winery_user).permit(:user_id, :winery_id, :permissions)
    end
end
