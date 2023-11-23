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
    @albums = []
    @games = []
    @genres = []
    @labels = []
    @authors = []
  end

  # Listing Methods

  def list_albums
    @albums = JSONifier.new.load_data('./data/albums.json')
    if @albums.empty?
      puts 'No albums in the database.'
    else
      @albums.each_with_index do |album, i|
        puts "#{i + 1}) Date: #{album['publish_date']}, On Spotify? #{album['on_spotify']}"
      end
    end
  end
  
  # Adding/Creating Methods

  def gather_data
    # Genre
    puts 'Genre name?'
    genre = gets.chomp.to_s

    new_genre = Genre.new(genre)
    @genres << new_genre
    genre_json = JSONifier.new
    genre_json.save_data('./data/genres.json', @genres)

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
    data[:genre], 
    data[:author], 
    data[:label],
    data[:publish_date],
    on_spotify)

    @albums << album

    json = JSONifier.new
    json.save_data('./data/albums.json', @albums)

    puts 'Album created successfully!'
  end
end
