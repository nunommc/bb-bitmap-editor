class Image
  def create(width:, height:)
    Array.new(height, Array.new(width, "O"))
  end
end
