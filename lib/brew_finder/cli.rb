class BrewFinder::CLI 
  
  def call 
    list_breweries
    brewery_details
  end
  
  def list_breweries
    puts "Welcome to Brew Finder! Let's find you some brews near you."
    puts "Please enter your 5-digit zipcode."
    
    input = gets.strip.to_i
    BrewFinder::API.breweries_nearby(input)
    
    BrewFinder::Brewery.all.each.with_index(1) {|b, i| puts "#{i}) #{b.name} - #{b.street} - #{b.brewery_type}"}
  end
  
  def brewery_details
    input = nil 

    puts "Which brewery would you like to learn more about? Please enter a number, or 'new zip' to try a new location or 'exit'." 
    
    while input != "exit"
    input = gets.strip.downcase
      if input.to_i > 0 && input.to_i <= BrewFinder::Brewery.all.length
        BrewFinder::Brewery.display_details(input.to_i-1)
      elsif input == "new zip"
        BrewFinder::Brewery.destroy_all
        list_breweries
      elsif input == "exit"
        goodbye
      else
        puts "Not sure what you meant... please pick a number from the list, or type 'new zip' or 'exit'"
      end

     end
  end
  
  def goodbye
    BrewFinder::Brewery.destroy_all
    puts "Goodbye, and thanks for checking out Brew Finder!"
  end
  
end