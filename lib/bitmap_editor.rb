class BitmapEditor
  def initialize(image)
    @image = image
  end

  attr_reader :image

  def run(command)
    command, w, h = command.split ' '
    @image.create(width: w.to_i, height: h.to_i)
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
