class BrewFinder::CLI 
  
  def call 
    welcome
    list_breweries
    brewery_details
  end
  
  def welcome
    puts "Welcome to Brew Finder! Let's find you some brews near you."
  end
  
  def list_breweries
    puts "Please enter your zipcode."
    #gets user input, finds breweries in that area from API and formats them in numbered list 
    @breweries = BrewFinder::Brewery.breweries_nearby#(input)
    
    @breweries.each.with_index(1) {|b, i| puts "#{i}) #{b.name} - #{b.street} - #{b.type}"}
      
  end
  
  def brewery_details
    input = nil 

    puts "Which brewery would you like to learn more about? Please enter a number. Or, type 'new zip' to try a new location or type 'exit'"
    
    while input != "exit"
     input = gets.strip.downcase
      if input.to_i > 0 
        puts @breweries[input.to_i-1]
      elsif input == "new zip"
        list_breweries
      else
        puts "Not sure what you meant, please type 'new zip' or 'exit'"
      end
     end
  end
  
  def goodbye
    puts "Goodbye, and thanks for checking out Brew Finder!"
  end
  
end