class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable
  validates :body, :user_id, :post_id, presence: true

  def total_value_summed
    self.votes.reduce(0){|sum, vote| sum + vote.value}
  end
end
