class Role < ActiveRecord::Base
  has_many :users
  
  validates :role_name, presence: true
end
