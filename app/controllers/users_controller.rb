class UsersController < ApplicationController
    
    def new
        @user = User.new
    end
          
    def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id 
          flash[:notice] = "Account Successfully created!"
          redirect_to user_path(@user)
        else
          flash[:errors] = @user.errors.full_messages
          render :new
        end
    end
    
    def show
        @user = User.find(params[:id])
        @posts = @user.posts
        
    end
    
       private 
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end