class BoardsController < ApplicationController
  def new
  end

  def create
    board = Board.create! title: params[:title], subtitle: params[:subtitle]
    redirect_to board_path(board) # "/boards/#{board.id}"
  end

  def show
    @board = Board.find params[:id]
  end
end