require 'rspec'
require './classes/genre'

describe Genre do
    let(:name) { 'Rock' }
    let(:item) { double('Item') }
    subject(:genre) { Genre.new(name) }

    it 'The name of the genre should be Rock' do
        expect(genre.name).to eql(name)
    end
  
    it 'add_item should add a new item into the genre' do
      expect(item).to receive(:genre=).with(genre)
      genre.add_item(item)
      expect(genre.items).to include(item)
    end
end