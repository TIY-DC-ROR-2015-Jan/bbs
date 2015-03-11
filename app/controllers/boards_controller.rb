class BoardsController < ApplicationController
  def new
    @board = Board.new
    authorize! :create, @board
  end

  def create
    board_params = params[:board]
    @board = Board.new title: board_params[:title], subtitle: board_params[:subtitle]
    @board.user = current_user
    authorize! :create, @board
    # @board = Board.new params[:board] <- need "Strong params"
    if @board.save
      redirect_to board_path(@board) # "/boards/#{board.id}"
    else
      # Do stuff
      render :new
    end
  end

  def edit
    @board = Board.find params[:id]
  end

  def update
    @board = Board.find params[:id]
    if @board.update subtitle: params[:board][:subtitle]
      redirect_to board_path(@board)
    else
      render :edit
    end
  end

  def show
    @board = Board.find params[:id]
    authorize! :read, @board
  end

  def index
    authorize! :read, Board
    @boards = Board.all
  end

  def destroy
    @board = Board.find params[:id]
    authorize! :delete, @board
    @board.destroy
    redirect_to boards_path
  end
end
