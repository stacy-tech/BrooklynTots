class SessionsController < ApplicationController

    def create 
        @user = User.find_by_email(params[:login][:email])
        if @user && @user.authenticate(params[:login][:password])
            session[:user_id] = @user.id 
            flash[:success] = "sucessfully logged in"
            redirect_to user_path(@user)
            
        else
            flash[:error] = "Incorrect email or password"
            redirect_to login_path
        end
    end

    
end