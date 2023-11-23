require_relative 'item'
require 'json'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(genre, author, label, publish_date, publisher, cover_state)
    super(genre, author, label, publish_date)
    @publisher = publisher
    @cover_state = cover_state
    @archived = can_be_archived?
  end

  def to_json(*_args)
    {
      'id' => @id,
      'genre' => @genre,
      'author' => @author,
      'label' => @label,
      'publisher' => @publisher,
      'cover_state' => @cover_state,
      'publish_date' => @publish_date,
      'archived' => @archived
    }.to_json
  end

  private

  def can_be_archived?
    return true if @cover_state == 'bad'

    false
  end
end
