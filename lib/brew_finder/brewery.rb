
class BrewFinder::Brewery
  attr_accessor :id, :name, :street, :brewery_type, :city, :state, :postal_code, :country, :longitude, :latitude, :phone, :website_url, :updated_at, :tag_list
  
  @@all = []
  
  def initialize(hash)
    hash.each {|k, v| self.send("#{k}=", v)}
    
    @@all << self
  end
  
  def self.display_details(index)
    b = self.all[index]
    puts "#{b.name}"
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
    
end