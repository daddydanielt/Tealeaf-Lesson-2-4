class Vote < ActiveRecord::Base  
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  # the value of 'creator' are unique based on a :scope parameter
  # validates_uniqueness_of :creatorm scopr: [:voteable_type, :voteable_id]
  validates_uniqueness_of :creator, scope: :voteable


  #-->
  # polymorphic
  belongs_to :voteable, polymorphic: true
  #-->
  
end