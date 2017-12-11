class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      @current_user = session[:user_id]
      redirect_to root_url, notice: "You're Logged in!"
    else
      redirect_to login_url, notice:"Email or password is invalid"
    end
  end

  def destroy
   session[:user_id] = nil
   redirect_to root_url, notice: "You've successfully Logged out!!"
  end

  def session_params
    params.require(:session).permit(
      :email,
      :password
    )
  end

end
