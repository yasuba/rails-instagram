class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        post = Post.create(params[:post].permit(:image, :description))
        redirect_to posts_path
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        flash[:notice] = "Photo deleted successfully"
        redirect_to posts_path
    end

end
