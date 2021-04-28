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
            redirect_to post_path(@post)
        else
            render :new
        end
    end

    def show
        @post = Post.find(params[:id])
        @comments = @post.comments
    end

    def edit
        @posts = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            flash[:notice] = "Post Successfully updated."
            redirect_to post_path
        else
            flash[:error]= post.errors.full_messages.to_sentence
            render :edit
        end

    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path   
    end

    private

    def post_params 
        params.require(:post).permit(:title, :content, :user_id)
    end
end