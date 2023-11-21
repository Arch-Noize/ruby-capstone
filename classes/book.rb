class Book
    attr_accessor :publisher, :cover_state
  
    def initialize(publisher, cover_state)
      @publisher = publisher
      @cover_state = cover_state
    end
  
    def can_be_archived?
        parent_can_be_archived = super # Call the parent class method

        if parent_can_be_archived || @cover_state == "bad"
          return true
        else
          return false
        end
    end
end