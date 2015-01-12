



# Using 'ActiveSupport::Concerns'
module Voteable
  extend ActiveSupport::Concern
    
  included do
    has_many :votes, as: :voteable    
  end

  def total_votes          
    up_votes - down_votes
  end

  def up_votes
    self.votes.where(vote: true).size
  end

  def down_votes
    self.votes.where(vote: false).size
  end

end

# The Ruby way for the module:
# This way is using normal metaprogramming. 
=begin
module Voteable
  
  def self.included( base )
    base.send(:include, InstanceMethods)
    base.extend ClassMethods
    base.class_eval do 
      my_class_method
    end
  end

  module InstanceMethods
    def total_votes          
      up_votes - down_votes
    end

    def up_votes
      self.votes.where(vote: true).size
    end

    def down_votes
      self.votes.where(vote: false).size
    end
  end


  module ClassMethods
    def my_class_method
      #--->  
      #polymorphic
      has_many :votes, as: :voteable
      #--->
    end
  end
end
=end