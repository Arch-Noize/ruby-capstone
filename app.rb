require './classes/author'
require './classes/book'
# require './classes/games'
require './classes/genre'
require './classes/label'
require './classes/music_album'
require_relative 'jsonifier'
require 'date'

class App
  def initialize
    @books = []
    @albums = JSONifier.new.load_data('./data/albums.json')
    @games = []
    @genres = []
    @labels = []
    @authors = []
  end

  # Listing Methods

  def list_albums
    if @albums.empty?
      puts 'No albums in the database.'
    else
      @albums.each_with_index do |album, i|
        puts "#{i + 1}) Date: #{album['publish_date']}, On Spotify? #{album['on_spotify']}"
      end
    end
  end
  
  # Adding/Creating Methods

  def create_item

    puts 'What type of item do you want to create? Choose from 1-3:'
    puts '1) A Book'
    puts '2) An Album'
    puts '3) A Game'
    option = gets.chomp

    case option
    when '1'

    when '2'

    when '3'

    else
        puts 'Invalid option. Please choose from the options above.'
    end
  end

  def gather_data
    # Genre
    puts 'Genre name?'
    genre = gets.chomp.to_s

    new_genre = Genre.new(genre)
    

    # Label
    puts 'Label name?'
    label_name = gets.chomp.to_s
    puts 'Label color?'
    label_color = gets.chomp.to_s

    new_label = Label.new(label_name, label_color)
    

    # Author
    puts 'Author first name?'
    author_first = gets.chomp.to_s
    puts 'Author last name?'
    author_last = gets.chomp.to_s

    new_author = Author.new(author_first, author_last)
    
    # Publish Date
    puts 'Publish Date (YYYY-MM-DD)?'
    publish_date = Date.parse(gets.chomp)

    # Returning all data
    { genre: new_genre, author: new_author, label: new_label, publish_date: publish_date }

  end

  def create_album
    data = gather_data

    print 'On Spotify [Y/N]?'
    on_spotify = gets.chomp.to_s.upcase

    album = MusicAlbum.new(
    genre: data[:genre], 
    author: data[:author], 
    label: data[:label],
    publish_date: data[:publish_date],
    on_spotify: on_spotify)

    @albums << album

    json = JSONifier.new
    json.save_data('./data/albums.json', @albums)

    puts 'Album created successfully!'
  end
end
