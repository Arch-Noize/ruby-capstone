require 'rspec'
require './classes/music_album'
require './classes/item'

describe MusicAlbum do
    before :each do
      @album = MusicAlbum.new('2002-1-1', 'y')
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