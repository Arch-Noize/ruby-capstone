require 'rspec'
require './classes/genre'
require './classes/item'

describe Genre do
  let(:genre) { Genre.new('Rock') }
  let(:item1) { Item.new('2020, 1, 1') }
  let(:item2) { Item.new('2021, 1, 1') }

  describe 'Testing attributes' do
    it 'The name of the genre should be Rock' do
      expect(genre.name).to eql('Rock')
    end
  end

  describe 'Testing adding items' do
    it 'add_item should add a new item into the genre' do
      genre.add_item(item1)
      expect(genre.items).to include(item1)
      expect(item1.genre).to eq(genre)
    end

    it 'Genre should be able to have multiple items' do
      genre.add_item(item1)
      genre.add_item(item2)
      expect(genre.items).to include(item1, item2)
      expect(item1.genre).to eq(genre)
      expect(item2.genre).to eq(genre)
    end
  end
end
