require 'rspec'
require 'hand'

RSpec.describe Hand do
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
    it "receives 2 cards from the top of the deck" do
      deck_cards = [card1, card2]
      deck = double("deck")
      expect(deck).to receive(:take).with(2).and_return(deck_cards)
      hand = Hand.new.deal_from(deck, 2)
      expect(hand.cards).to eq(deck_cards)
    end
  end

  describe '#<=>' do
    it "returns -1 when the hand on the left beats the right" do
      expect(hand <=> hand1).to eq(-1)
    end
    it "returns 1 when the hand on the right beats the left" do
      expect(hand1 <=> hand).to eq(1)
    end
  end
end



# 2.send(:+, 1) == 2 + 1
#
# def direction
#   :+ : :-
# end
#
# pos.send(direction, 1)


# hand1 <=> hand2
