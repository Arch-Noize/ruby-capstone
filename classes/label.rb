require 'json'

class Label
  attr_accessor :id, :title, :color, :items

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self if item.respond_to?(:label=)
  end

  def list_items
    @items.map(&:title)
  end

  def archive_items
    @items.each do |item|
      item.archive_if_possible if item.respond_to?(:archive_if_possible)
    end
  end

  def to_json(*_args)
    {
      'id' => @id,
      'title' => @title,
      'color' => @color
    }.to_json
  end
end
