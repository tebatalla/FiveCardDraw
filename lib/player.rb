class Player
  attr_accessor :pot, :hand

  def initialize(name, pot)
    @name = name
    @pot = pot
  end

  def action(game)
    input = 's'
    while input == s && pot < game.current_bet
      begin
        puts "What would you like to do?"
        input = gets.chomp.downcase
        if input == 's'
          game.pot
        elsif input == 'f'
          game.fold(player)
        elsif input == 'c'
          pot -= game.current_bet
          game.pot += game.current_bet
        elsif input == 'r'
          raise NotEnoughMoney if pot < (game.current_bet * 2)
          game.current_bet *= 2
          pot -= game.current_bet
          game.pot += game.current_bet
        end
      rescue NotEnoughMoney
        puts "Not enough money to raise, try a different action"
        retry
      end
    end

  end

  def discard

  end
end

class NotEnoughMoney < StandardError
end
