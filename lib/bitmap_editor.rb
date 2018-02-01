class BitmapEditor
  attr_accessor :image

  def initialize(image)
    @image = image
  end

  def run(command)
    split_command = command.split(" ")
    case split_command[0]
    when 'I'
      create(split_command)
    when 'L'
      add_colour(split_command)
    else
      return "Unknown command"
    end
  end

  def create(split_command)
    width = split_command[1].to_i
    height = split_command[2].to_i
    image.create({width: width, height: height})
  end

  def add_colour(split_command)
    x = split_command[1].to_i
    y = split_command[2].to_i
    colour = split_command[3]
    image.add_colour({x: x, y: y, colour: colour})
  end
end
