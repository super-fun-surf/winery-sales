class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase )
    if user && user.authenticate(params[:session][:password])
      log_in user      
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user, notice: 'Welcome. Have you entered this months Numbers?'
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new', notice: "Invalid Login"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to signup_path, notice: "taker easy"
  end
end
