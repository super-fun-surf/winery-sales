class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to wineries_path
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase )
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user, notice: 'Welcome.'
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new', notice: "Invalid Login"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to log_in_path, notice: "Goodbye"
  end
end
