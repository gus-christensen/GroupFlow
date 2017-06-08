class Post < ActiveRecord::Base
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable
  belongs_to :creator, class_name: :User
  has_many :answers
  validates :question, :title, :creator_id, presence: true
end
