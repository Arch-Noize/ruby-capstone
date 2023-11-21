require 'rspec'
require './classes/label'
require './classes/item'
require 'json'

RSpec.describe Label do
  describe '#add_item' do
    it 'adds an item to the label' do
      label = Label.new(1, 'Example Label', 'blue')
      item = Item.new(Time.new(2010, 1, 1))
      allow(item).to receive(:label=)

      label.add_item(item)

      expect(label.items).to include(item)
      expect(item).to have_received(:label=).with(label)
    end
  end

  describe '#list_items' do
    it 'lists titles of all items in the label' do
      label = Label.new(1, 'Example Label', 'blue')
      item1 = double('item', title: 'Book 1')
      item2 = double('item', title: 'Book 2')
      label.items = [item1, item2]

      expect(label.list_items).to eq(['Book 1', 'Book 2'])
    end
  end

  describe '#archive_items' do
    it 'archives items in the label' do
      label = Label.new(1, 'Example Label', 'blue')
      item1 = Item.new(Time.new(2010, 1, 1))
      item2 = Item.new(Time.new(2022, 1, 1))

      label.items = [item1, item2]

      allow(item1).to receive(:move_to_archive)
      allow(item2).to receive(:move_to_archive)

      label.archive_items

      expect(item1).to have_received(:move_to_archive)
      expect(item2).not_to have_received(:move_to_archive)
    end
  end

  describe '#to_json' do
    it 'returns a JSON representation of the label' do
      label = Label.new(1, 'Example Label', 'blue')
      item1 = Item.new(Time.new(2020, 1, 1))
      item2 = Item.new(Time.new(2022, 1, 1))
      label.items = [item1, item2]

      expected_json = {
        'id' => 1,
        'title' => 'Example Label',
        'color' => 'blue',
        'items' => [
          item1.to_json,
          item2.to_json
        ]
      }.to_json

      expect(label.to_json).to eq(expected_json)
    end
  end
end
