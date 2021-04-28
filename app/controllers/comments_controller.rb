class CommentsController < ApplicationController

    def new
        if params[:post_id] && @post = Post.find_by_id(params[:posts_id])
            @comment = @posts.comment.new
        else 
            flash[:error]= "This Post has been deleted" if params[:posts_id]
            @comment = Comment.new
        end
    end

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new(comment_params)
        if @comment.save
            redirect_to post_path(@post)
        else
            if params[:post_id] && @post = Post.find_by_id(params[:posts_id])
                @comment = @posts.comment.new
            else 
                flash[:error]= "This Post has been deleted" if params[:posts_id]
                @comment = Comment.new
            end  
            render :new
        end
    end

    def show
        @comment = Comment.find(params[:id])
    end

    private

    def comment_params 
        params.require(:comment).permit(:content, :post_id).merge(user_id:current_user.id)
    end
end