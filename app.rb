require './classes/author'
require './classes/book'
require './classes/game'
require './classes/genre'
require './classes/label'
require './classes/music_album'
require_relative 'jsonifier'
require 'date'

class App
  def initialize
    @books = JSONifier.new.load_data('./data/books.json')
    @albums = JSONifier.new.load_data('./data/albums.json')
    @games = JSONifier.new.load_data('./data/games.json')
    @genres = JSONifier.new.load_data('./data/genres.json')
    @labels = JSONifier.new.load_data('./data/labels.json')
    @authors = JSONifier.new.load_data('./data/authors.json')
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

  def list_books
    @books = JSONifier.new.load_data('./data/books.json')
    if @books.empty?
      puts 'No books in the database.'
    else
      @books.each_with_index do |book, i|
        puts "#{i + 1}) Cover state: #{book['cover_state']}, Publisher: #{book['publisher']}"
      end
    end
  end

  def list_games
    @games = JSONifier.new.load_data('./data/games.json')
    if @games.empty?
      puts 'No games in the database.'
    else
      @games.each_with_index do |game, i|
        puts "#{i + 1}) Multiplayer: #{game['multiplayer']}, Last played at: #{game['last_played_at']}"
      end
    end
  end

  def list_authors
    @authors = JSONifier.new.load_data('./data/authors.json')
    if @authors.empty?
      puts 'No authors in the database.'
    else
      @authors.each_with_index do |author, i|
        puts "#{i + 1}) First name: #{author['first_name']}, Last name: #{author['last_name']}"
      end
    end
  end

  def list_genres
    @genres = JSONifier.new.load_data('./data/genres.json')
    if @genres.empty?
      puts 'No genres in the database.'
    else
      @genres.each_with_index do |genre, i|
        puts "#{i + 1}) name: #{genre['name']}"
      end
    end
  end

  def list_labels
    @labels = JSONifier.new.load_data('./data/labels.json')
    if @labels.empty?
      puts 'No labels in the database.'
    else
      @labels.each_with_index do |label, i|
        puts "#{i + 1}) Title: #{label['title']}, Color: #{label['color']}"
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
    save_json_data('./data/genres.json', @genres)

    # Label
    puts 'Label name?'
    label_name = gets.chomp.to_s
    puts 'Label color?'
    label_color = gets.chomp.to_s
    new_label = Label.new(label_name, label_color)
    @labels << new_label
    save_json_data('./data/labels.json', @labels)

    #Author
    puts 'Author first name?'
    author_first = gets.chomp.to_s
    puts 'Author last name?'
    author_last = gets.chomp.to_s
    new_author = Author.new(author_first, author_last)
    @authors << new_author
    save_json_data('./data/authors.json', @authors)

    #Publish_date
    puts 'Publish Date (YYYY-MM-DD)?'
    publish_date = Date.parse(gets.chomp)

    { genre: new_genre, author: new_author, label: new_label, publish_date: publish_date }
  end

  # save to JSON
  def save_json_data(file_path, data)
    json_save = JSONifier.new
    json_save.save_data(file_path, data)
  end

  # Album creation
  def create_album
    data = gather_data
    print 'On Spotify [Y/N]?'
    on_spotify = gets.chomp.to_s.upcase

    album = MusicAlbum.new(
      data[:genre],
      data[:author],
      data[:label],
      data[:publish_date],
      on_spotify
    )

    @albums << album
    json = JSONifier.new
    json.save_data('./data/albums.json', @albums)
    puts 'Album created successfully!'
  end

  # Book creation
  def create_book
    data = gather_data
    puts 'Publisher?'
    publisher = gets.chomp.to_s.capitalize
    puts 'Book Cover State [Good/Bad]? '
    cover_state = gets.chomp.to_s.downcase

    book = Book.new(
      data[:genre],
      data[:author],
      data[:label],
      data[:publish_date],
      publisher,
      cover_state
    )

    @books << book
    json = JSONifier.new
    json.save_data('./data/books.json', @books)
    puts 'Book created successfully!'
  end

  # Game Creation
  def create_game
    data = gather_data
    puts 'Multiplayer [Y/N]?'
    multiplayer = gets.chomp.to_s.upcase
    puts 'Last Played At? (YYYY-MM-DD)?'
    last_played_at = gets.chomp

    game = Game.new(
      data[:genre],
      data[:author],
      data[:label],
      data[:publish_date],
      multiplayer,
      last_played_at
    )

    @games << game
    json = JSONifier.new
    json.save_data('./data/games.json', @games)
    puts 'Game created successfully!'
  end
end
