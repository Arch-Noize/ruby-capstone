require 'json'

class Item
  attr_accessor :id, :genre, :author, :source, :label, :publish_date, :archived

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @genre = nil
    @author = nil
    @source = nil
    @label = nil
    @publish_date = publish_date
    @archived = false
  end

  def move_to_archive
    @archived = true if can_be_archived? == true
    nil
  end

  def to_json(*_args)
    {
      'id' => @id,
      'genre' => @genre,
      'author' => @author,
      'source' => @source,
      'label' => @label,
      'publish_date' => @publish_date,
      'archived' => @archived
    }.to_json
  end

  def archive_if_possible
    move_to_archive if can_be_archived?
  end

  private

  def can_be_archived?
    # Time.now.year is an internal ruby class that prints out the current year
    (Time.now.year - @publish_date.year) > 10
  end
end
