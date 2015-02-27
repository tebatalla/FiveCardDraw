require 'deck'

class Hand
  attr_reader :cards

  def initialize(cards = [])
    @cards = cards
  end

  def <=>(other_hand)
    self.value <=> other_hand.value
  end

  def deal_from(deck, n = 5)
    @cards += deck.take(n)
    self
  end

  def value

  end

  private
    def straight_flush?
      flush? && straight?
    end

    def sorted_cards
      cards.sort_by { |card| card.value }
    end

    def four_kind?
      counter = 2
      (0...5).each do |i|
        counter -= 1 if sorted_cards[i].value != sorted_cards[i + 1].value
      end
      counter > 0
    end

    def full_house?
      
    end

    def flush?
      cards.all? { |card| card.suit == cards.first.suit }
    end

    def straight?
      counter = sorted_cards[0].value
      4.times do |i|
        counter += 1
        return false unless sorted_cards[i].value == counter
      end
      true
    end

    def three_kind?
      counter = 3
      (0...5).each do |i|
        counter -= 1 if sorted_cards[i].value != sorted_cards[i + 1].value
      end
      counter > 0
    end

    def two_pair?

    end

    def one_pair?

    end
end
