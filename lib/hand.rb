require 'deck'

class Hand
  attr_accessor :cards

  def self.deal_from(deck)
    Hand.new(deck.take(5))
  end

  def initialize(cards = [])
    @cards = cards
  end

  def <=>(other_hand)
    self.value <=> other_hand.value
  end

  def value
    if straight_flush?
      9
    elsif four_kind?
      8
    elsif full_house?
      7
    elsif flush?
      6
    elsif straight?
      5
    elsif three_kind?
      4
    elsif two_pair?
      3
    elsif one_pair?
      2
    else
      1
    end
  end

  def discard(cards, deck)
    if cards.none?{ |card| self.cards.include?(card) }
      raise "Card not in hand"
    elsif cards.length > 3
      raise "Can only drop up to 3 cards"
    else
      self.cards.delete_if { |card| cards.include?(card) }
      deal_new(cards.count, deck)
    end
  end

  def deal_new(n, deck)
    self.cards += deck.take(n)
  end

  private
    def straight_flush?
      flush? && straight?
    end

    def four_kind?
      counter = 2
      (0...(cards.length - 1)).each do |i|
        counter -= 1 if sorted_cards[i].value != sorted_cards[i + 1].value
      end
      counter > 0
    end

    def full_house?
      cards.uniq { |card| card.value } == 2
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
      (0...(cards.length - 1)).each do |i|
        counter -= 1 if sorted_cards[i].value != sorted_cards[i + 1].value
      end
      counter > 0
    end

    def two_pair?
      counter = 0
      sorted_cards.each_with_index do |card, i|
        sorted_cards.drop(i + 1).each do |card2|
          counter += 1 if card.value == card2.value
        end
      end
      counter == 2
    end

    def one_pair?
      sorted_cards.each_with_index do |card, i|
        sorted_cards.drop(i + 1).each do |card2|
          return true if card.value == card2.value
        end
      end
      false
    end

    def sorted_cards
      cards.sort_by { |card| card.value }
    end
end
