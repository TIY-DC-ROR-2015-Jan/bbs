class Post < ActiveRecord::Base
  belongs_to :board
  belongs_to :user

  validates :user, presence: true
  validates :board, presence: true

  validates :title, length: { minimum: 6 }
  validates :body, length: { minimum: 8 }
end
