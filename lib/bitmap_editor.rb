require 'ostruct'
class BitmapEditor

  def initialize(image)
    @image = image
  end

  attr_reader :image

  def run(c)
    command, *args = c.split(' ')
    case command
    when 'I', 'i'
      @image.create(width: args[0].to_i, height: args[1].to_i)
    when 'L'
      @image.paint_pixel(pixel: OpenStruct.new(x: args[0].to_i, y: args[1].to_i), colour: args[2])
    when 'V'
      @image.paint_vertical_segment(x: args[0].to_i, y1: args[1].to_i, y2: args[2].to_i, colour: args[3])
    when 'H'
      @image.paint_horizontal_segment(x1: args[0].to_i, x2: args[1].to_i, y1: args[2].to_i, colour: args[3])
    end
  end

  class WidthOutOfBounds < RuntimeError ; end
  class HeightOutOfBounds < RuntimeError ; end

  private
=begin
    def sanitize_params!(command)
      command, w, h = command.split ' '
      w = w.to_i
      h = h.to_i
      raise WidthOutOfBounds.new('') if w < 1 || w > 250
      raise HeightOutOfBounds.new('') if h < 1 || h > 250
      [command, w, h]
    end
=end
end
