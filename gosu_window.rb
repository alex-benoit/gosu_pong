require 'gosu'
require_relative 'player'
require_relative 'ball'

class GosuWindow < Gosu::Window
  def initialize  #constructor
    super(880, 600)  # call the method in the parent with the same name
    self.caption = "Pong"

    @font = Gosu::Font.new(20)

    @player1 = Player.new(self, 'left')
    @player2 = Player.new(self, 'right')
    @ball = Ball.new(self, @player1, @player2)
  end

  def update
    @ball.update
    @player1.update
    @player2.update
  end

  def draw
    @ball.draw
    @player1.draw
    @player2.draw
    @font.draw("Score: #{@player1.score}", 30, 30, 1)
    @font.draw("Score: #{@player2.score}", 750, 30, 1)
  end
end

window = GosuWindow.new
window.show
