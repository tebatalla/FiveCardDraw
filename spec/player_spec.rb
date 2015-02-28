require 'rspec'
require 'player'

describe Player do
  subject(:player) { Player.new("Joe", 5) }
  describe '#hand' do
    it 'returns the hand' do
      hand = double("hand")
      player.hand = hand
      expect(player.hand).to eq(hand)
    end
  end

  describe '#pot' do
    it 'returns value of the pot' do
      pot = 10_000
      player.pot = pot
      expect(player.pot).to eq(pot)
    end
  end
end
