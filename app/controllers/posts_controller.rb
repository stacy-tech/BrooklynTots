class PostsController < ApplicationController

    def new
        @post = Post.new
    end

    def index
        @posts = current_user.posts
        
    end 

    def create
        @post = Post.new(post_params)
        @post.user = current_user
        if @post.save
            redirect_to post_path
        else
            render :new
        end
    end

    def show
        @posts = Post.find_by_id(params[:id])
    end

    def update
    end

    private

    def post_params 
        params.require(:post).permit(:title, :content, :user_id)
    end
end