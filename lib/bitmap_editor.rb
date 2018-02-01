class BitmapEditor
  attr_accessor :image

  def initialize(image)
    @image = image
  end

  def run(command)
    split_command = command.split(" ")
    case split_command[0]
    when 'C'
      create(split_command)
    when 'L'
      add_colour(split_command)
    else
      return "Unknown command"
    end
  end

  def create
    width = split_command[1].to_i
    height = split_command[2].to_i
    image.create({width: width, height: height})
  end
end
