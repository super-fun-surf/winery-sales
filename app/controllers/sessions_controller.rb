class SessionsController < ApplicationController
  def new
    if logged_in? && !admin?
      if current_user.wineries.present?
        redirect_to current_user.wineries.first
      else
        redirect_to current_user
      end
    elsif admin?
      redirect_to wineries_path
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase )
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      if user.wineries.present?
        redirect_back_or user.wineries.first, notice: 'Welcome.'
        #redirect_to user.wineries.first
      else
        redirect_to user, notice: 'Welcome'
      end
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new', notice: "Invalid Login"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_path, notice: "Goodbye"
  end
end
