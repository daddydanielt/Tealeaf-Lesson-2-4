class Category < ActiveRecord::Base
  
  #include Slugable
  #===========>>
  # Daniel Tseng:
  # include your module_name
  include SlugableDanielTest  
  #===========>>
  slugable_column :name

  has_many :post_categories
  has_many :posts, through: :post_categories

  validates :name, presence: true, length: {minimum: 2}

  def to_param
    self.slug
  end



end