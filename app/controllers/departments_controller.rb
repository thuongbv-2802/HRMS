class DepartmentsController < ApplicationController
    before_action :correct_user, only: [:create, :update]
    before_action :logged_in_user, only: [:index, :edit, :update, :new, :create] 

    def index
        @departments = Department.all
    end

    def show
        redirect_to root_path
    end

    def new
        @department = Department.new
    end

    def create
        @department = Department.new(dept_params)
        if @department.save
            flash[:success] = "Create new department is successfully!"
            redirect_to @department
        else
            render 'new'
        end
    end

    def edit
        @department = Department.find(params[:id])
    end

    def update
        @department = Department.find(params[:id])
        if @department.update(dept_params)
            flash[:success] = "Department updated"
            redirect_to departments_path
        else 
            render 'edit'
        end
    end

    private

        def dept_params
            params.require(:department).permit(:name, :description)
        end

        def logged_in_user
            unless logged_in?
                flash[:danger] = "Please log in."
                redirect_to login_url
            end
        end

        def correct_user
            redirect_to(root_url) unless is_admin(current_user)
        end
end
