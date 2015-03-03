class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    post_params = params[:post]
    @post = current_user.posts.new(
      title: post_params[:title],
      body: post_params[:body]
    )
    if @post.save
      flash[:notice] = "Post created!"
      redirect_to post_path(@post)
    else
      render :new
    end
  end
end
