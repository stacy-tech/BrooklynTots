class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :logged_in?

    # return current user if any
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def authorize
        if current_user.nil?
            flash[:error] = "You must be logged in to access this page."
            redirect_to login_path
        end
    end

    def logged_in?
        !!current_user # returns a boolean true/false if user is logged in 
    end

    def require_logged_in
        if current_user.nil?
            redirect_to login_path
        end
    end
end
