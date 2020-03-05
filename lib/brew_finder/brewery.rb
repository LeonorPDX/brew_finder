class BrewFinder::Brewery
  attr_accessor :name, :street, :type
  
  def self.breweries_nearby#(zip)
    #Returns a bunch of breweries near a given zip
    
    br1 = self.new
    br1.name = "Flying Fish"
    br1.street = "SE Hawthorne"
    br1.type = "Beers and grub"
    
    br2 = self.new
    br2.name = "Kells"
    br2.street = "NW 21st"
    br2.type = "Irish pub with beers, full bar, and elevated food"
    
    br3 = self.new
    br3.name = "Fireside"
    br3.street = "NW 23rd"
    br3.type = "Oh you fancy"
    
    [br1, br2, br3]
    
  end
    
end