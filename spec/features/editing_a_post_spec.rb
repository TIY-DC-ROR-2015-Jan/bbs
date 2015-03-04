require 'rails_helper'

feature "Post editing" do
  before :each do
    @board = Board.create! title: "Test Board", subtitle: "-"
    @user  = User.create! email: "u1@example.com", password: "password"
    @post  = Post.create! user: @user, board: @board, title: "Six characters", body: "Eight characters"
  end

  it "can be performed by the author" do
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: 'password'
    click_on 'Log in'

    visit edit_post_path(@board, @post)
    fill_in 'Title', with: 'New Title'
    fill_in 'Body', with: 'Even more characters!'
    click_on 'Submit'

    expect(page).to have_content 'Post updated!'
    expect(page).to have_content 'New Title'
    expect(page).to have_content 'Even more characters!'
  end

  it "redirects to login if needed" do
    visit edit_post_path(@board, @post)
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
