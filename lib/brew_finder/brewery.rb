require 'httparty'

class BrewFinder::Brewery
  attr_accessor :id, :name, :street, :brewery_type, :city, :state, :postal_code, :country, :longitude, :latitude, :phone, :website_url, :updated_at, :tag_list
  
  def initialize(hash)
    hash.each {|k, v| self.send("#{k}=", v)}
  end
  
  
  def self.breweries_nearby(zip)
    #Returns a bunch of breweries near a given zip
    
    breweries = HTTParty.get("https://api.openbrewerydb.org/breweries?by_postal=#{zip}")
    
    
    breweries.each do |brewery_hash| 
      new = self.new(brewery_hash)
      @all << new
    end
    
    @all
    
    
    
#    br1 = self.new
#    br1.name = "Flying Fish"
#    br1.street = "SE Hawthorne"
#    br1.type = "Beers and grub"
#    
#    br2 = self.new
#    br2.name = "Kells"
#    br2.street = "NW 21st"
#    br2.type = "Irish pub with beers, full bar, and elevated food"
#    
#    br3 = self.new
#    br3.name = "Fireside"
#    br3.street = "NW 23rd"
#    br3.type = "Oh you fancy"
#    
#    [br1, br2, br3]
  end
    
end