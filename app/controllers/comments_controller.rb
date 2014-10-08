class CommentsController < ApplicationController

    def new
        @post = Post.find(params[:post_id])
        # @user = User.find(current_user)
        @comment = Comment.new  
    end

    def create
        @post = Post.find(params[:post_id])
        @user = User.find(current_user)
        @comment = Comment.new(params[:comment].permit(:write_a_comment))
        @comment.user = @user
        @comment.post = @post
        @comment.save
        redirect_to posts_path
    end

end
