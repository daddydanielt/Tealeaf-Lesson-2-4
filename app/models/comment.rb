class Comment < ActiveRecord::Base  
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  belongs_to :post

  #--->  
  #polymorphic
  has_many :votes, as: :voteable
  #-->
  
  validates :body, presence: true, length: {minimum: 2}
    
  def total_votes
    #self.votes.size
    up_votes - down_votes
  end

  def up_votes
    self.votes.where(vote: true).size
  end
  def down_votes
    self.votes.where(vote: false).size
  end
end
