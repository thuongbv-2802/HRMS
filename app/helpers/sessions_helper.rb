module SessionsHelper
    # Logs in the given user.
    def log_in(user)
        session[:user_id] = user.id
    end

    # ghi nhớ người dùng trong session.
    def remember(user)
        user.remember
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end

    # Returns true if the given user is the current user.
    def current_user?(user)
        user == current_user
    end

    # Returns true if position is admin
    def is_admin(user)
        user.position.eql? "admin"
    end

    # Trả về người dùng tương ứng với cookie 
    def current_user
        if (user_id = session[:user_id])
            @current_user ||= User.find_by(id: user_id)
        elsif (user_id = cookies.signed[:user_id])
            @user = User.find_by(id: user_id)
            if @user && @user.authenticated?(cookies[:remember_token])
              log_in @user
              @current_user = @user
            end
        end
    end

    # Returns true if the user is logged in, false otherwise.
    def logged_in?
        !current_user.nil?
    end

    # Forgets session.
    def forget(user)
        user.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end

    # Logs out the current user.
    def log_out
        forget(current_user)
        session.delete(:user_id)
        @current_user = nil
    end

    # Return index in table
    def index_table(index)
        params[:page] ? index + 30*(params[:page].to_i-1) : index
    end

    # Row hover in table
    def row_hover(status)
        "color:" + "gray" if !status
    end

    # Return department name
    def depart_infor(id)
        Department.find(id).name
    end

    def cout_staff(depart)
        # !(User.find_by(department_id:dept.id)) ? "0" : (User.where(department_id:dept.id)).count
        if !User.find_by(department_id: depart)
            "0"
        else 
            User.where(department_id: depart).count
        end
    end
end
