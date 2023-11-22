require_relative 'app'

def display_menu
  puts 'Welcome to Catalog of my things App!'
  puts '1. Create Album'
  puts '2. List Albums'
  puts '3. Option 3'
  puts '4. Quit'
end

def get_user_input(prompt)
  print "#{prompt}: "
  gets.chomp
end

def main
  app = App.new
  loop do
    display_menu
    user_choice = get_user_input('Enter the number of your choice')

    perform_option(user_choice, app)
  end
end

def perform_option(option, app)
  case option
  when '1'
    app.create_album
  when '2'
    app.list_albums
  when '3'
    puts 'Selected Option 3'
  when '4'
    puts 'Exiting the app. Goodbye!'
    exit
  else
    puts 'Invalid option. Please choose a valid option.'
  end
end

# Run the main function when the script is executed
main
