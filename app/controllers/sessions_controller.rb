class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    # xác thực người dùng
    if @user && @user.authenticate(params[:session][:password])
      flash[:success] = 'Login is successfull !'
      log_in @user
      remember @user
      redirect_to root_path
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
