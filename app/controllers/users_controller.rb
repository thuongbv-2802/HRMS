class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def index
    if params[:department]
      @users = User.search_department(params[:department]).paginate(page: 1, per_page: 30)
    else
      @users = User.search_name(params[:query]).paginate(page: params[:page], per_page: 30)
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    logged_in_user
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if is_admin(current_user) || is_leader(current_user) 
      if @user.save
        flash[:success] = "Create new user is successfully!"
        redirect_to @user
      else
        render 'new'
      end
    else
      redirect_to root_path
      flash[:danger] = "You must be leader or admin"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
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
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone, :home_town, :date_birth, :position, :status, :department_id)
    end

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      unless current_user?(@user) || is_admin(current_user)
        redirect_to(root_url)
        # lấy user hiện tại trong cookie
        flash[:danger] = "Not allow."
      end
    end

end
