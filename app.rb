require './classes/author'
require './classes/book'
# require './classes/games'
require './classes/genre'
require './classes/label'
require './classes/music_album'

class App

    def initialize
        @books = []
        @albums = []
        @games = []
        @genres = []
        @labels = []
        @authors = []
    end

    def list_albums
        if @albums.empty?
            puts "No albums in the database."
        else
            @albums.each_with_index do |album, i|
                puts "#{i+1}) Date: #{album.publish_date}, On Spotify? #{album.on_spotify.upcase}"
            end
        end
    end

    def create_album
        print 'Publish Date: '
        publish_date = gets.chomp.to_s
        print 'On Spotify [Y/N]? '
        on_spotify = gets.chomp.to_s.upcase

        album = MusicAlbum.new(publish_date, on_spotify)
        @albums << album

        puts "Album created successfully!"
    end
    
end