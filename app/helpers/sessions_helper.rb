module SessionsHelper
    def current_user
        if session[:user_id]
            @current_user ||= User.find(session[:user_id])
        else
            @current_user = nil
        end
    end

    def current_user?(user)
        user && user == current_user
    end

    def logged_in?
        !current_user.nil?
    end

end
