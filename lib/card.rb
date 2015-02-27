class Card
  attr_reader :suit, :value, :display_value

  VALUE_HASH = {
    14 => "Ace",
    13 => "King",
    12 => "Queen",
    11 => "Jack",
    10 => "Ten",
    9 => "Nine",
    8 => "Eight",
    7 => "Seven",
    6 => "Six",
    5 => "Five",
    4 => "Four",
    3 => "Three",
    2 => "Two"
  }

  def initialize(suit, value)
    @suit = suit
    @display_value = VALUE_HASH[value]
    @value = value
  end

  def display
    "#{display_value} of #{suit}"
  end
end
