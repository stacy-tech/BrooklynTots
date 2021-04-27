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
        byebug
        @comment = current_user.comments.new(comment_params)
        if @comment.save
            redirect_to post_comment_path
        else
            render :new
        end
    end

    def show
        @comment = Comment.find(params[:id])
    end

    private

    def comment_params 
        params.require(:comment).permit(:content, :post_id)
    end
end