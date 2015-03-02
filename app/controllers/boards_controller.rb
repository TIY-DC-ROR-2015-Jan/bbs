class BoardsController < ApplicationController
  def new
    @board = Board.new
  end

  def create
    board_params = params[:board]
    @board = Board.new title: board_params[:title], subtitle: board_params[:subtitle]
    # @board = Board.new params[:board] <- need "Strong params"
    if @board.save
      redirect_to board_path(@board) # "/boards/#{board.id}"
    else
      # Do stuff
      render :new
    end
  end

  def show
    @board = Board.find params[:id]
  end

  def index
    @boards = Board.all
  end
end