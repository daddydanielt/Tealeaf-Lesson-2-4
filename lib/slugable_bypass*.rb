module Slugable 
  extend ActiveSupport::Concern

  included do
    before_save :generate_slug     
    class_attribute :slug_column, instance_accessor: false    
  end

  # fix hardcode :title
  def generate_slug        
    #if self.title == "Google%%__@@!!"  # for the convience of testing 
      # ------------------>>           
      #self.slug = slug_uniqueize( self, options: { slugable_column: :title, count: -1 })
      self.slug = slug_uniqueize( self, options: { column_name: self.class.slug_column.to_sym, count: -1 })
      # ------------------>>
    #end
  end
  
  # ------------------>>
  def slug_uniqueize(obj, options: {} )    
    the_slug = generate_slug_prefix(obj, options[:column_name]) + generate_slug_suffix(options[:count])
    record = obj.class.find_by slug: the_slug      
    if record && record != obj # the_slug has already been used by the others.
      options[:count] += 1          
      return slug_uniqueize(obj, options: options)    
    end  
    the_slug
  end

  def generate_slug_suffix(count)
    (count + 1) == 0 ? "" : "-"+(count + 1).to_s   
  end

  def generate_slug_prefix(obj, column_name)    
    #obj[column_name].gsub(/\W/," ").split.join("-").downcase      
    obj[column_name].gsub(/\s*[^A-Za-z0-9]\s*/," ").split.join("-").downcase      
  end
  # ------------------>>


  module ClassMethods
    def slugable_column column_name
      puts self
      self.slug_column = column_name
      puts "okokokokokokokokokokokok"
    end
  end


end



   
  