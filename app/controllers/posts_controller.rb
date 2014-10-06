class PostsController < ApplicationController

    before_action :authenticate_user!, :except => [:index]

    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        current_user.posts.create(params[:post].permit(:image, :description))
        redirect_to posts_path
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        flash[:notice] = "Photo deleted successfully"
        redirect_to posts_path
    end

end
