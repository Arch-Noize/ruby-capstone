require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify)
    super(genre, author, label, publish_date)
    @on_spotify = on_spotify
  end

  def on_spotify?
    @on_spotify == 'y'
  end

  def to_json(*_args)
    {
      'id' => @id,
      'genre' => @genre.to_json,
      'author' => @author.to_json,
      'label' => @label.to_json,
      'publish_date' => @publish_date,
      'on_spotify' => @on_spotify
    }.to_json
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
