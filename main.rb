def display_menu
    puts "Welcome to Catalog of my things App!"
    puts "1. Option 1"
    puts "2. Option 2"
    puts "3. Option 3"
    puts "4. Quit"
end
  
def get_user_input(prompt)
    print "#{prompt}: "
    gets.chomp
end
  
def perform_option(option)
    case option
    when '1'
      puts "Selected Option 1"
    when '2'
      puts "Selected Option 2"
    when '3'
      puts "Selected Option 3"
    when '4'
      puts "Exiting the app. Goodbye!"
      exit
    else
      puts "Invalid option. Please choose a valid option."
    end
end
  
def main
    loop do
      display_menu
      user_choice = get_user_input("Enter the number of your choice")
  
      perform_option(user_choice)
    end
end
  
# Run the main function when the script is executed
main