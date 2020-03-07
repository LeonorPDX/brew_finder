
class BrewFinder::Brewery
  attr_accessor :id, :name, :street, :brewery_type, :city, :state, :postal_code, :country, :longitude, :latitude, :phone, :website_url, :updated_at, :tag_list
  
  @@all = []
  
  def initialize(hash)
    hash.each {|k, v| self.send("#{k}=", v)}
    @@all << self
  end
  
  def self.display_details(index)
    b = self.all[index]
    puts "---------------".colorize(:green)
    puts "#{b.name} is located at #{b.street} in #{b.city}, #{b.state}."
    puts "Here are some details about #{b.name}:"
    puts "Type:".colorize(:yellow) + " #{b.brewery_type}"
    puts "Phone:".colorize(:yellow) + " #{b.phone}"
    puts "Website:".colorize(:yellow) + " #{b.website_url}"
    puts "---------------".colorize(:green)
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
    
end