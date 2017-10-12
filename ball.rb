class Ball
  # DATA / STATE
  def initialize(window, player1, player2)
    @image = Gosu::Image.new('media/ball.png')
    @window = window
    @player1 = player1
    @player2 = player2
    reset
  end

  # BEHAVIOR
  def update
    @x += Gosu.offset_x(@angle, 10)
    @y += Gosu.offset_y(@angle, 10)

    # bouncing on top and bottom
    if @y >= (@window.height - @image.height)
      @angle -= 90
    end
    if @y <= 0
      @angle += 90
    end

    # bouncing on paddles
    # ball above of below paddle
    if @player2.y > (@y + @image.height) || (@player2.y + @player2.image.height) < @y
      # nothing
    elsif @x + @image.width >= @player2.x
      @angle -= 270
    end
    if @player1.y > (@y + @image.height) || (@player1.y + @player1.image.height) < @y
      # nothing
    elsif @x <= @player1.x + @image.width
      @angle += 270
    end

    # score
    if @x <= 0
      @player2.wins
      reset
    elsif (@x - @image.width) >= @window.width
      @player1.wins
      reset
    end
  end

  def draw
    @image.draw(@x, @y, 1)
  end

  private

  def reset
    @x = (@window.width - @image.width) / 2
    @y = (@window.height - @image.height) / 2
    @angle = [45, 135, 225, 315].sample
  end
end
