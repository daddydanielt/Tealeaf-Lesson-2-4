class Post < ActiveRecord::Base
  
  #include Voteable
  #===========>>
  # Daniel Tseng:
  # include your module_name
  include VoteableDanieltTest  
  #===========>>
    

  #include Slugable
  #===========>>
  # Daniel Tseng:
  # include your module_name
  include SlugableDanielTest  
  #===========>>
  slugable_column :title

  #--->
  #belongs_to :user
  belongs_to :creator , foreign_key: 'user_id', class_name: 'User'  
  #--->

  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories

  validates :title, presence: true, length: {minimum: 5}
  validates :description, presence: true
  validates :url, presence: true, uniqueness: true

  #before_save :generate_slug
  
  #def generate_slug        
  #  if self.title == "Google%%__@@!!"  # for the convience of testing 
  #    # ------------------>>      
  #    #count = -1
  #    #self.slug = slug_uniqueize( self, -1 )
  #    self.slug = slug_uniqueize( self, options: { column: :title, count: -1 })
  #    # ------------------>>
  #  end
  #end
  
  # ------------------>>
  #def slug_uniqueize(obj, options: {} )    
  #  the_slug = generate_slug_prefix(obj, options[:column]) + generate_slug_suffix(options[:count])
  #  record = obj.class.find_by slug: the_slug      
  #  if record && record != obj # the_slug has already been used by the others.
  #    options[:count] += 1          
  #    return slug_uniqueize(obj, options: options)    
  #  end  
  #  the_slug
  #end

  #def generate_slug_suffix(count)
  #  (count + 1) == 0 ? "" : "-"+(count + 1).to_s   
  #end

  #def generate_slug_prefix(obj, column)    
  #  #obj[column].gsub(/\W/," ").split.join("-").downcase      
  #  obj[column].gsub(/\s*[^A-Za-z0-9]\s*/," ").split.join("-").downcase      
  #end
  # ------------------>>
  
  def to_param
    self.slug
  end
end