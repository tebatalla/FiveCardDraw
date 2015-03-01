require_relative 'player'
require_relative 'hand'

class Game
  attr_reader :deck
  attr_accessor :pot, :current_bet

  def initialize(deck = Deck.new, players = {})
    @players = players
    @deck = deck
    @pot = 0
    @current_bet = 0
  end

  def play
    @players.each do |player|
      player.hand = Hand.deal_from(deck)
    end
    @players.each do |player|
      player.action
    end
    @players.each do |player|
      player.discard
    end
    @players.each do |player|
      player.action
    end
    check_winner
  end

  def fold(player)
    @players.delete(player)
  end
end
