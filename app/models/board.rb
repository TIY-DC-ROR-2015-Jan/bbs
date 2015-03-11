class Board < ActiveRecord::Base
  validates_uniqueness_of :title
  validates_presence_of :title, :subtitle

  has_many :posts, dependent: :destroy
end
