class Post < ActiveRecord::Base
  belongs_to :board
  belongs_to :user

  validates :title, length: { minimum: 6 }
  validates :body, length: { minimum: 64 }
end
