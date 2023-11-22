require_relative 'item'
require 'date'
require 'json'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @archived = false
  end

  def move_to_archive
    @archived = true if can_be_archived?
    nil
  end

  def to_json(*_args)
    {
      'multiplayer' => @multiplayer,
      'last_played_at' => @last_played_at,
      'publish_date' => @publish_date,
      'archived' => @archived
    }.to_json
  end

  private

  def can_be_archived?
    super && last_played_over_2_years_ago?
  end

  def last_played_over_2_years_ago?
    current_date = Date.today
    last_played_date = Date.parse(last_played_at)
    years_difference = (current_date - last_played_date).to_i / 365

    years_difference > 2
  end
end
