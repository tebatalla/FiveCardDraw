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

  describe '#bankroll' do
    it 'returns value of the bankroll' do
      bankroll = 10_000
      player.bankroll = bankroll
      expect(player.bankroll).to eq(bankroll)
    end
  end
end
