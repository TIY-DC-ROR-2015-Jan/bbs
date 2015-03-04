class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  #before_action :authenticate_user!, except: [:show]
  #before_action :authenticate_user, only: [:new, :create, :edit, :update]
  before_action :set_board

  def new
    @post = @board.posts.new
    @post.user = current_user
  end

  def create
    @post = @board.posts.new params.require(:post).permit(:title, :body)
    @post.user = current_user
    if @post.save
      flash[:notice] = "Post created!"
      redirect_to post_path(@board, @post)
    else
      render :new
    end
  end

  def show
    @post = @board.posts.find params[:id]
  end

  def edit
    @post = @board.posts.find params[:id]
  end

  def update
    @post = current_user.posts.find params[:id] # What about @board?
    if @post.update params.require(:post).permit(:title, :body)
      flash[:notice] = "Post updated!"
      redirect_to post_path(@board, @post)
    else
      render :edit
    end
  end

private

  def set_board
    @board = Board.find params[:board_id]
  end

end
