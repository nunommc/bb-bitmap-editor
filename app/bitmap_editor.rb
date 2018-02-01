class BitmapEditor
  attr_accessor :image

  def initialize(image)
    @image = image
  end

  def run(command)
    split_command = command.split(" ")
    width = split_command[1].to_i
    height = split_command[2].to_i
    image.create({width: width, height: height})
  end
end
