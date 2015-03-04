require 'rails_helper'

describe PostsController do
  it "does not allow a user to edit other posts" do
    board = Board.create! title: "Test Board", subtitle: "-"
    u1    = User.create! email: "u1@example.com", password: "password"
    u2    = User.create! email: "u2@example.com", password: "password"
    p     = u1.posts.create board: board, title: "I'll tell you", body: "what was wrong with the Ford administration ..."

    login u2
    expect do
      patch :update, board_id: board.id, id: p.id, post: { title: "You got hacked", body: "-" }
    end.to raise_error ActiveRecord::RecordNotFound

    p.reload
    expect(p.body).to eq "what was wrong with the Ford administration ..."
  end
end
