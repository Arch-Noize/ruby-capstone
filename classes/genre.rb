require_relative 'item'

class Genre
  attr_reader :items
  attr_accessor :name

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end

  def to_json(*_args)
    {
      'id' => @id,
      'name' => @name
    }.to_json
  end
end
