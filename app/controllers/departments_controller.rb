class DepartmentsController < ApplicationController

    def new
        @department = Department.new
    end

    def index
        @departments = Department.all
    end

    def show
        redirect_to root_path
    end

    def edit
        @department = Department.find(params[:id])
    end

    def update
        @department = Department.find(params[:id])
        if is_admin(current_user)
            if @department.update(dept_params)
                flash[:success] = "Department updated"
                redirect_to departments_path
            else 
                render 'edit'
            end
        else
            redirect_to root_path
            flash[:danger] = "You must be admin"
        end
    end

    private
        def dept_params
            params.require(:department).permit(:name, :description)
        end
end
