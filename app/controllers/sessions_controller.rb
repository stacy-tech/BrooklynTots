class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create 
        @user = User.find_by_email(params[:login][:email])
        if @user && @user.authenticate(params[:login][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:error] = "Incorrect email or password"
            redirect_to login_path
        end
    end

    def omniauth
        @user = User.find_or_create_by(email: auth["info"]["email"]) do |u|
            u.username = auth['info']['name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex
        end
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to '/'
        end
    end 

    def destroy
        session.clear
        redirect_to root_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end