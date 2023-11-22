require 'rspec'
require './classes/book'
require 'json'

RSpec.describe Book do
  let(:sample_publisher) { 'Sample publisher' }
  let(:good_cover_book) { Book.new(sample_publisher, 'good', Date.new(2020, 1, 1)) }
  let(:bad_cover_book) { Book.new(sample_publisher, 'bad', Date.new(2020, 1, 1)) }

  describe '#move_to_archive' do
    it 'sets archived to true if cover can be archived' do
      allow(bad_cover_book).to receive(:can_be_archived?).and_return(true)
      bad_cover_book.move_to_archive
      expect(bad_cover_book.archived).to be true
    end

    it 'sets archived to false if cover cannot be archived' do
      allow(good_cover_book).to receive(:can_be_archived?).and_return(false)
      good_cover_book.move_to_archive
      expect(good_cover_book.archived).to be false
    end
  end

  describe '#to_json' do
    it 'returns a JSON representation of the book' do
      publisher = 'Example Publisher'
      cover_state = 'good'
      publish_date = Date.new(2020, 1, 1)
      book = Book.new(publisher, cover_state, publish_date)

      json_result = {
        'id' => book.id,
        'publisher' => publisher,
        'cover_state' => cover_state,
        'publish_date' => publish_date,
        'archived' => false
      }.to_json

      expect(book.to_json).to eq(json_result)
    end
  end
end
