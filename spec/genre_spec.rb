require 'rspec'
require './classes/genre'

describe Genre do
  let(:item) { double('Item') }

  before :each do
    name = 'Rock'
    @genre = Genre.new(name)
  end

  it 'adds item inside the genre' do
    @genre.add_item(item)
    expect(@genre.items).to include(item)
  end
end