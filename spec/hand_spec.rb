require 'rspec'
require 'hand'

describe Hand do
  let(:card1) { Card.new("spades", 14) }
  let(:card2) { Card.new("clubs", 14) }
  let(:card3) { Card.new("clubs", 3) }
  let(:card4) { Card.new("clubs", 2) }
  let(:card5) { Card.new("clubs", 8) }
  let(:card6) { Card.new("clubs", 9) }
  let(:card7) { Card.new("diamonds", 5) }
  let(:hand) { Hand.new([card1, card2, card7, card6, card5]) }
  let(:hand1) { Hand.new([card2, card3, card4, card5, card6]) }

  describe '#cards' do
    it 'has an array of cards' do
      card1 = double("card")
      card2 = double("card")
      cards = [card1, card2]
      hand = Hand.new(cards)
      expect(hand.cards).to eq([card1, card2])
    end
  end

  describe '#value' do
    it "returns the hand's value" do
      expect(hand.value).to eq(2)
      expect(hand1.value).to eq(6)
    end
  end

  describe '#deal_from' do
    it "receives 5 cards from the top of the deck" do
      deck_cards = [card1, card2, card3, card4, card5]
      deck = double("deck")
      expect(deck).to receive(:take).with(5).and_return(deck_cards)
      hand = Hand.deal_from(deck)
      expect(hand.cards).to eq(deck_cards)
    end
  end

  describe '#<=>' do
    it "returns -1 when the hand on the left beats the right" do
      expect(hand <=> hand1).to eq(-1)
    end
  end

  describe '#discard' do
    it 'discards the cards in the array given' do
      deck_cards = [card3, card4, card5]
      hand.discard([card1, card2], deck_cards)
      expect(hand.cards).not_to include(card1, card2)
    end

    it 'raises an error when you discard a card not in your hand' do
      deck_cards = [card1, card2, card3, card4, card5]
      expect{ hand.discard([card3], deck_cards) }.to raise_error
    end

    it 'raises an error when you discard too many cards' do
      deck_cards = [card1, card2, card3, card4, card5]
      expect{ hand.discard([card1, card2, card7, card6], deck_cards) }.to raise_error
    end
  end

  describe '#deal_new' do
    it 'should receive two new cards' do
      deck_cards = [card1, card2, card3, card4, card5]
      hand.deal_new(2, deck_cards)
      expect(hand.cards.count).to eq(7)
    end
  end
end
