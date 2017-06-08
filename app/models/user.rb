class User < ActiveRecord::Base
  has_many :posts, foreign_key: :creator_id
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable
  has_many :answers
  validates :email, :password, presence: true
end
