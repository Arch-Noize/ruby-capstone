require 'rspec'
require './classes/label'
require './classes/item'

RSpec.describe Label do
  describe '#add_item' do
    it 'adds an item to the label' do
      label = Label.new('Example Label', 'blue')
      item = Item.new('Rock', 'John', 'Strong', '2001, 1, 1')
      allow(item).to receive(:label=)

      label.add_item(item)

      expect(label.items).to include(item)
      expect(item).to have_received(:label=).with(label)
    end
  end

  describe '#list_items' do
    it 'lists titles of all items in the label' do
      label = Label.new('Example Label', 'blue')
      item1 = double('item', title: 'Book 1')
      item2 = double('item', title: 'Book 2')
      label.items = [item1, item2]

      expect(label.list_items).to eq(['Book 1', 'Book 2'])
    end
  end
end
