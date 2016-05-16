class UsersController < ApplicationController
  include UserMailgun
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.order(created_at: :desc).paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def send_new_activation_email
    @user = User.find(params[:id])
    @user.create_activation_digest
    @user.save
    send_user_activation_mail(@user, "Wineries: New User Registration")
    render json: { status: :ok }
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      send_user_activation_mail(@user, "Wineries - New User Registration")
      redirect_to @user, notice: "User account created: Welcome!"
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

      def user_params
        params.require(:user).permit(:name, :email, :password,
                                     :password_confirmation)
      end
      def logged_in_user
        unless logged_in?
          store_location
          flash[:danger] = "Please log in."
          redirect_to login_url
        end
      end

      def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless @user == current_user
      end
end
