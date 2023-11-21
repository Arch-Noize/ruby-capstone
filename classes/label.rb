require 'json'

class Label
    attr_accessor :id, :title, :color, :items
  
    def initialize(id, title, color)
      @id = id
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
            item.move_to_archive if item.respond_to?(:move_to_archive) && item.can_be_archived?
        end
    end

    def to_json
        {
          'id' => @id,
          'title' => @title,
          'color' => @color,
          'items' => @items.map(&:to_json)
        }.to_json
    end
end