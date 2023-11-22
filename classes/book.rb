require_relative 'item'
require 'json'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    return true if @cover_state == 'bad'

    false
  end

  def to_json(*_args)
    {
      'publisher' => @publisher,
      'cover_state' => @cover_state
    }.to_json
  end
end
