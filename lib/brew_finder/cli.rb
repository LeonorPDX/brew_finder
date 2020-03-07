class BrewFinder::CLI 
  
  def call 
    welcome
    search_breweries
    brewery_details
  end
  
  def welcome 
    puts "Welcome to Brew Finder! Let's find you some brews near you."
    puts
   puts "              ~  ~"
   puts "         ( o )o)"
   puts "       ( o )o )o)"
   puts "     (o( ~~~~~~~~o "
   puts "     ( )' ~~~~~~~' "
   puts "     ( )|)       |-.__.. "
   puts "       o|   _    |-__  | "
   puts "       o|  |_)   |   | | "
   puts "        |  |_)   |   | | "
   puts "       o|        |  / /  "
   puts "        |        | / / "
   puts "        |        |- ' "
   puts "        .========.  "
   puts ""
  end
  
  def search_breweries
    puts "Would you like to see a selection of 50 breweries in your state,"
    puts "or all the breweries in your zip code? Please type 'zip' or 'state'."
    choice = gets.strip.downcase
    
    if choice == "zip"
      puts "Please enter your 5-digit zipcode."
      input = gets.strip.to_i
      BrewFinder::API.breweries_zip(input)
      display_zip
    elsif choice == "state"
      puts "Please enter the full, unabbreviated name of your state."
      input = gets.strip.downcase.gsub(" ","_")
      BrewFinder::API.breweries_state(input)
      display_state
    elsif choice == "exit"
      goodbye
    else
      puts "Please type either 'zip' or state'."
    end
  end
    
  def display_zip
    puts ""
    BrewFinder::Brewery.all.each.with_index(1) {|b, i| puts "#{i}) #{b.name} - #{b.street} - #{b.brewery_type}"}
    puts ""
  end
  
  def display_state
    puts ""
    BrewFinder::Brewery.all.each.with_index(1) {|b, i| puts "#{i}) #{b.name} - #{b.city} - #{b.brewery_type}"}
    puts ""
  end
  
  def brewery_details
    input = nil 
    while input != "exit"
    puts "Which brewery would you like to learn more about? Please enter a number, or 'new location' to search again or 'exit'." 
    
    input = gets.strip.downcase
      if input == "exit"
        goodbye
      elsif input.to_i > 0 && input.to_i <= BrewFinder::Brewery.all.length
        BrewFinder::Brewery.display_details(input.to_i-1)
      elsif input == "new location"
        BrewFinder::Brewery.destroy_all
        search_breweries
      else
        puts "Not sure what you meant..."
        puts "Please pick a number from the list, or type 'new location' or 'exit'"
      end
     end
  end
  
  def goodbye
    BrewFinder::Brewery.destroy_all
    puts "Goodbye, and thanks for checking out Brew Finder!"
  end
  
end