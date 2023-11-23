require_relative 'app'

def display_menu
  puts 'Welcome to Catalog of my things App!'
  puts '1. List Albums'
  puts '2. List Books'
  puts '3. List Games'
  puts '4. List Authors'
  puts '5. List Genres'
  puts '6. List Labels'
  puts '7. Create Album'
  puts '8. Create Book'
  puts '9. Create Game'
  puts '0. Quit'
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

# rubocop:disable Metrics/CyclomaticComplexity
def perform_option(option, app)
  case option
  when '1'
    app.list_albums
  when '2'
    app.list_books
  when '3'
    app.list_games
  when '4'
    app.list_authors
  when '5'
    app.list_genres
  when '6'
    app.list_labels
  when '7'
    app.create_album
  when '8'
    app.create_book
  when '9'
    app.create_game
  when '0'
    puts 'Exiting the app. Goodbye!'
    exit
  else
    puts 'Invalid option. Please choose a valid option.'
  end
end
# rubocop:enable Metrics/CyclomaticComplexity

# Run the main function when the script is executed
main
