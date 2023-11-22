require_relative 'item'
require 'json'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, publish_date)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
    @archived = false
  end

  def to_json(*_args)
    {
      'id' => @id,
      'publisher' => @publisher,
      'cover_state' => @cover_state,
      'publish_date' => @publish_date,
      'archived' => @archived
    }.to_json
  end

  def move_to_archive
    @archived = true if can_be_archived?
    nil
  end

  private

  def can_be_archived?
    return true if @cover_state == 'bad'
    false
  end
end
