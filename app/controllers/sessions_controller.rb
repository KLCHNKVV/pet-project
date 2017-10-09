class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email:params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      log_in user
      remember_user
      redirect_to user
    end
  else
    flash.now[:danger] = 'Invalid email/password'
    #render 'new'
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
