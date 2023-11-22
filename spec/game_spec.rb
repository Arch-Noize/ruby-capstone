require 'rspec'
require './classes/game'
require 'date'

describe Game do
  let(:publish_date) { Date.new(2019, 1, 1) }
  let(:game) { Game.new(true, '2022-01-01', publish_date) }

  describe '#move_to_archive' do
    context 'when can be archived' do
      it 'sets archived to true' do
        allow(game).to receive(:can_be_archived?).and_return(true)
        game.move_to_archive
        expect(game.archived).to be true
      end
    end

    context 'when cannot be archived' do
      it 'does not set archived to true' do
        allow(game).to receive(:can_be_archived?).and_return(false)
        game.move_to_archive
        expect(game.archived).to be false
      end
    end
  end

  describe '#can_be_archived?' do
    context 'when both super and last_played_over_2_years_ago? are true' do
      it 'returns true' do
        allow_any_instance_of(Item).to receive(:can_be_archived?).and_return(true)
        allow(game).to receive(:last_played_over_2_years_ago?).and_return(true)
        expect(game.send(:can_be_archived?)).to be true
      end
    end

    context 'when either super or last_played_over_2_years_ago? is false' do
      it 'returns false' do
        allow_any_instance_of(Item).to receive(:can_be_archived?).and_return(false)
        allow(game).to receive(:last_played_over_2_years_ago?).and_return(true)
        expect(game.send(:can_be_archived?)).to be false
      end
    end
  end
end
