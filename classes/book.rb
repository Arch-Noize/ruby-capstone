require_relative './item'
require 'json'

class Book < Item
    attr_accessor :publisher, :cover_state
  
    def initialize(publisher, cover_state)
      @publisher = publisher
      @cover_state = cover_state
    end
  
    def can_be_archived?
        if @cover_state == "bad"
            return true
        else
            return false
        end
    end

    def to_json
        {
            'publisher' => @publisher,
            'cover_state' => @cover_state
        }.to_json
    end
end