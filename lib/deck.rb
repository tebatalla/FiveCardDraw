require 'card'

class Deck
  attr_reader :cards

  def initialize(cards = default_cards)
    @cards = cards.shuffle
  end

  def default_cards
    cards = []
    %w[spades diamonds hearts clubs].each do |suit|
      (2..14).each do |value|
        cards << Card.new(suit, value)
      end
    end

    cards
  end

  def count
    cards.count
  end

  def take(n)
    taken = []
    n.times { taken << cards.pop }
    taken
  end
end
