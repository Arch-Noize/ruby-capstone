require 'rspec'
require './classes/music_album'
require './classes/genre'
require './classes/author'
require './classes/label'
require './classes/item'

describe MusicAlbum do
  before :each do
    @genre = Genre.new('Rock')
    @author = Author.new('John', 'Doe')
    @label = Label.new('Strong', 'Brown')
    @album = MusicAlbum.new(@genre, @author, @label, '2002-1-1', true)
  end

  it 'should be instance of MusicAlbum' do
    expect(@album).to be_an_instance_of(MusicAlbum)
  end

  it 'should inherit the Item class' do
    expect(@album).to be_a(Item)
  end

  it 'should be on Spotify' do
    expect(@album.on_spotify?).to be(true)
  end
end
