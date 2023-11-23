require_relative 'item'

class Author
  attr_reader :items
  attr_accessor :id, :first_name, :last_name

  def initialize(first_name, last_name)
    @id = Random.rand(1...1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end

  def to_json(*_args)
    {
      'id' => @id,
      'first_name' => @first_name,
      'last_name' => @last_name
    }.to_json
  end
end
