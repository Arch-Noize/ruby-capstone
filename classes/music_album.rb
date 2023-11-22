require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(published_date, on_spotify)
    super(published_date)
    @on_spotify = on_spotify
  end

  def on_spotify?
    @on_spotify == 'y'
  end

  def to_json(*_args)
    {
      'id' => @id,
      'genre' => @genre,
      'author' => @author,
      'label' => @label,
      'on_spotify' => @on_spotify,
      'publish_date' => @publish_date
    }.to_json
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
