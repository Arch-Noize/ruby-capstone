require 'rspec'
require './classes/book'
require 'json'

RSpec.describe Book do
  let(:sample_publisher) { 'Sample publisher' }
  let(:good_cover_book) { Book.new(sample_publisher, 'good') }
  let(:bad_cover_book) { Book.new(sample_publisher, 'bad') }

  describe '#can_be_archived?' do
    it 'return true if the cover state is bad' do
      expect(bad_cover_book.can_be_archived?).to be(true)
    end

    it 'return the result of the parent method if cover state is not bad' do
      allow(good_cover_book).to receive(:can_be_archived?).and_return(false)
      expect(good_cover_book.can_be_archived?).to be(false)
    end
  end

  describe '#to_json' do
    it 'returns a JSON representation of the book' do
      publisher = 'Example Publisher'
      cover_state = 'good'
      book = Book.new(publisher, cover_state)

      json_result = {
        'publisher' => publisher,
        'cover_state' => cover_state
      }.to_json

      expect(book.to_json).to eq(json_result)
    end
  end
end
