require './player/a_player'
require './interface/input'
require './interface/renderer'
require './game/match'

# Author: Roman Schmidt, Daniel Osterholz
#
# Get data from the input class instance
class Human
  include APlayer

  def get_code
    i = 0
    @symbols_to_guess = []
    begin
      @renderer.draw_enter_code(Match::SYMBOLS, i += 1)
      @symbols_to_guess.push(@input.get_symbol(Match::SYMBOLS))
    end while @symbols_to_guess.size < Match::SYMBOL_NUMBER
    @symbols_to_guess
  end

  def get_guess
    @renderer.draw_single_guess(@match.guess_no + 1, Match::SYMBOLS)
    guess = []
    i = 0
    begin
      guess.push(get_single_guess(i = i + 1))
    end while guess.size < Match::SYMBOL_NUMBER
    guess
  end

  private

  def get_single_guess(no)
    @renderer.draw_get_guess(no)
    @input.get_symbol(Match::SYMBOLS)
  end
end