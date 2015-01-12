class User < ActiveRecord::Base
 
  #include Slugable
  #===========>>
  # Daniel Tseng:
  # include your module_name
  include SlugableDanielTest  
  #===========>>
  slugable_column :username


  belongs_to :role

  has_many :posts
  has_many :comments
  has_many :votes 
  
  has_secure_password validations: false
  
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 5}

  
  after_initialize :default_role
  
  def default_role
    self.role ||= Role.find_by( role_name: "user" )
  end

  def to_param
    self.slug
  end

  def admin?
    self.role.role_name == "admin"
  end
end
