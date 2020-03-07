class BrewFinder::CLI 
  
  def call 
    welcome
    search_breweries
    brewery_details
  end
  
  def welcome 
    puts "Welcome to Brew Finder! Let's find you some brews near you.".colorize(:yellow)
    puts
   puts "              ~  ~"
   puts "         ( o )o)"
   puts "       ( o )o )o)"
   puts "     (o( ~~~~~~~~o "
   puts "     ( )'" + " ~~~~~~~' ".colorize(:yellow)
   puts "     ( )|) " + "      |-.__.. ".colorize(:yellow)
   puts "       o" + "|   _    |-__  | ".colorize(:yellow)
   puts "       o" + "|  |_)   |   | | ".colorize(:yellow)
   puts "        |  |_)   |   | | ".colorize(:yellow)
   puts "       o" + "|        |  / /  ".colorize(:yellow)
   puts "        |        | / / ".colorize(:yellow)
   puts "        |        |- ' ".colorize(:yellow)
   puts "        .========.  ".colorize(:yellow)
   puts ""
  end
  
  def search_breweries
    puts "Would you like to see a selection of 50 breweries in your state,".colorize(:yellow)
    puts "or all the breweries in your zip code? Please type 'zip' or 'state'.".colorize(:yellow)
    choice = gets.strip.downcase
    
    if choice == "zip"
      puts "Please enter your 5-digit zipcode.".colorize(:yellow)
      input = gets.strip.to_i
      BrewFinder::API.breweries_zip(input)
      display_zip
    elsif choice == "state"
      puts "Please enter the full, unabbreviated name of your state.".colorize(:yellow)
      input = gets.strip.downcase.gsub(" ","_")
      BrewFinder::API.breweries_state(input)
      display_state
    else
      puts "I'm sorry, that is not a valid choice.".colorize(:yellow)
    end
  end
    
  def display_zip
    puts ""
    BrewFinder::Brewery.all.each.with_index(1) {|b, i| puts "#{i})".colorize(:yellow) + " #{b.name} - #{b.street} - #{b.brewery_type}"}
    puts ""
    puts "Which brewery would you like to learn about? Please enter a number.".colorize(:yellow)
  end
  
  def display_state
    puts ""
    BrewFinder::Brewery.all.each.with_index(1) {|b, i| puts "#{i})".colorize(:yellow) + " #{b.name} - #{b.city} - #{b.brewery_type}"}
    puts ""
    puts "Which brewery would you like to learn about? Please enter a number.".colorize(:yellow)
  end
  
  def brewery_details
    input = nil 
    while input != "exit" 
    puts "You can type 'start over' to search again or 'exit'.".colorize(:yellow)
  
    input = gets.strip.downcase
      if input == "exit"
        goodbye
      elsif input.to_i > 0 && input.to_i <= BrewFinder::Brewery.all.length
        BrewFinder::Brewery.display_details(input.to_i-1)
        puts "Pick a new number from the list to learn about another brewery.".colorize(:yellow)
      elsif input == "start over"
        BrewFinder::Brewery.destroy_all
        search_breweries
      else
        puts "Not sure what you meant... Please pick a number from the list.".colorize(:yellow)
      end
     end
  end
  
  def goodbye
    BrewFinder::Brewery.destroy_all
    puts "Goodbye, and thanks for checking out Brew Finder!".colorize(:yellow)
  end
  
end