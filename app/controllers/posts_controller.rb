class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @board = Board.find params[:board_id]
    post_params = params[:post]
    @post = current_user.posts.new post_params
    if @post.save
      flash[:notice] = "Post created!"
      redirect_to post_path(@board, @post)
    else
      render :new
    end
  end

  def show
    #@post = Post.find params[:id]
    #@board = @post.board
    @board = Board.find params[:board_id]
    @post = @board.posts.find params[:id]
  end

private

  def post_params
    # Strong params
    params.require(:post).permit(:title, :body, :board_id)
  end
end
