class BrewFinder::API
  
  def self.breweries_zip(zip)
    breweries = HTTParty.get("https://api.openbrewerydb.org/breweries?by_postal=#{zip}")
    
    breweries.each {|brewery_hash| BrewFinder::Brewery.new(brewery_hash)}
  end
  
  def self.breweries_state(state)
    breweries = HTTParty.get("https://api.openbrewerydb.org/breweries?per_page=50&by_state=#{state}")
    
    breweries.each {|brewery_hash| BrewFinder::Brewery.new(brewery_hash)}
  end
  
end