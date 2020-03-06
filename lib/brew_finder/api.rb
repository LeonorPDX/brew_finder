class BrewFinder::API
  
  def self.breweries_nearby(zip)
    breweries = HTTParty.get("https://api.openbrewerydb.org/breweries?by_postal=#{zip}")
    
    breweries.each {|brewery_hash| BrewFinder::Brewery.new(brewery_hash)}
  end
  
end