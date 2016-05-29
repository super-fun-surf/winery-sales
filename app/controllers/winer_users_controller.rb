class WinerUsersController < ApplicationController
  before_action :set_winer_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index]
  before_action :admin_user
  

  # GET /winer_users
  # GET /winer_users.json
  def index
    @winer_users = WinerUser.all
  end

  # GET /winer_users/1
  # GET /winer_users/1.json
  def show
  end

  # GET /winer_users/new
  def new
    @winer_user = WinerUser.new
  end

  # GET /winer_users/1/edit
  def edit
  end

  # POST /winer_users
  # POST /winer_users.json
  def create
    @winer_user = WinerUser.new(winer_user_params)

    respond_to do |format|
      if @winer_user.save
        format.html { redirect_to @winer_user, notice: 'Winer user was successfully created.' }
        format.json { render :show, status: :created, location: @winer_user }
      else
        format.html { render :new }
        format.json { render json: @winer_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /winer_users/1
  # PATCH/PUT /winer_users/1.json
  def update
    respond_to do |format|
      if @winer_user.update(winer_user_params)
        format.html { redirect_to @winer_user, notice: 'Winer user was successfully updated.' }
        format.json { render :show, status: :ok, location: @winer_user }
      else
        format.html { render :edit }
        format.json { render json: @winer_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /winer_users/1
  # DELETE /winer_users/1.json
  def destroy
    @winer_user.destroy
    respond_to do |format|
      format.html { redirect_to winer_users_url, notice: 'Winer user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_winer_user
      @winer_user = WinerUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def winer_user_params
      params.require(:winer_user).permit(:user_id, :winery_id, :permissions)
    end
end
