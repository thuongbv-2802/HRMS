class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:update]
  before_action :admin_user, only: [:create, :destroy]

  def index
    if params[:department]
      @users = User.search_department(params[:department]).paginate(page: 1, per_page: 30)
    else
      @users = User.search_name(params[:query]).paginate(page: params[:page], per_page: 30)
    end
  end

  def show
    @user = find_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Create new user is successfully!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = find_user
  end

  def update
    @user = find_user  
    if @user.update(update_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      flash[:danger] = "Update failed"
      redirect_to users_path
    end
  end

  def destroy
    @user = find_user
    if !is_admin(@user)
      @user.destroy
      flash[:success] = "User deleted"
      redirect_to users_path
    else
      flash[:danger] = "Can't delete user"
      redirect_to users_path
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone, :home_town, :date_birth, :position, :status, :department_id)
    end

    def update_params
      params.require(:user).permit(:name, :email, :phone, :home_town, :date_birth, :position, :status, :department_id)
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
      @user = find_user
      redirect_to(root_url) unless current_user?(@user) || is_admin(current_user)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless is_admin(current_user)
    end

    def find_user
      User.find(params[:id])
    end

end
