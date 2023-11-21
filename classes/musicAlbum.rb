require_relative 'item'

class musicAlbum < Item
    attr_accessor :on_spotify

    def initialize(on_spotify)
        super(genre, author, source, label, publish_date)
        @on_spotify = on_spotify
    end

    private

    def can_be_archived?
        cba = super

        unless cba && @on_spotify
            return false
        end

        true
    end
end