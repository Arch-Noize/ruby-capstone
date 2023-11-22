require 'rspec'
require './classes/author'
require './classes/item'

describe Author do
  let(:author) { Author.new('Santiago', 'Ruido') }
  let(:item1) { Item.new('2020, 1, 1') }
  let(:item2) { Item.new('2021, 1, 1') }

  describe 'Testing attributes' do
    it 'should have Santiago as first name' do
      expect(author.first_name).to eq('Santiago')
    end

    it 'should have Ruido as first name' do
      expect(author.last_name).to eq('Ruido')
    end

    it 'has an empty list of items' do
      expect(author.items).to be_empty
    end
  end

  describe 'Testing adding items' do
    it 'adds an item to the author' do
      author.add_item(item1)
      expect(author.items).to include(item1)
      expect(item1.author).to eq(author)
    end

    it 'adds multiple items to the author' do
      author.add_item(item1)
      author.add_item(item2)
      expect(author.items).to include(item1, item2)
      expect(item1.author).to eq(author)
      expect(item2.author).to eq(author)
    end
  end
end
