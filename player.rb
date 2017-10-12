class Player
  attr_reader :x, :y, :image, :score
  # DATA / STATE
  def initialize(window, side)
    @score = 0
    @image = Gosu::Image.new('media/paddle.png')
    @window = window
    @side = side
    if @side == 'left'
      @x = 30
    else
      @x = @window.width - @image.width - 30
    end
    @y = (@window.height - @image.height) / 2
  end

  def update
    if Gosu.button_down?(up_btn)
      @y -= 5 unless @y < 0
    elsif Gosu.button_down?(down_btn)
      @y += 5 unless @window.height - @image.height < @y
    end
  end

  def draw
    @image.draw(@x, @y, 1)
  end

  def wins
    @score += 1
  end

  private

  def up_btn
    if @side == 'left'
      Gosu::KB_W
    else
      Gosu::KB_UP
    end
  end

  def down_btn
    if @side == 'left'
      Gosu::KB_S
    else
      Gosu::KB_DOWN
    end
  end
end
