require 'rspec'
require 'deck'

RSpec.describe Deck do
  subject(:deck) { Deck.new }

  describe '#count' do
    it 'returns a count of 52 cards' do
      expect(deck.count).to eq(52)
    end


  end

  describe '#take' do

    it "deals 5 cards" do
      expect(deck.take(5).count).to eq(5)
    end

    it 'returns a count of 47 when 5 cards have been dealt' do
      deck.take(5)
      expect(deck.count).to eq(47)
    end

    it "takes cards from the top of the deck (last)" do
      top = deck.cards.last
      expect(deck.take(1)).to eq([top])
    end
  end
end
