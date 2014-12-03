class AddTimestamps < ActiveRecord::Migration
  def change    
    add_timestamps(:users) 
    add_timestamps(:posts) 
    add_timestamps(:comments) 
  end
end
