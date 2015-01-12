class Comment < ActiveRecord::Base    
  
  #include Voteable
  #===========>>
  # Daniel Tseng:
  # include your module_name
  include VoteableDanieltTest
  #===========>>

  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  belongs_to :post

  #--->  
  #polymorphic
  #has_many :votes, as: :voteable
  #-->
  
  validates :body, presence: true, length: {minimum: 2}
  
end
