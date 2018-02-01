require_relative '../lib/bitmap_editor'

describe BitmapEditor do
  let(:image) { double(:image) }

  describe "I M N" do
    context "with a well formatted command" do
      it "creates a 2x2 white image" do
        expect(image).to receive(:create).with(width: 2, height: 2)

        BitmapEditor.new(image).run('I 2 2')
      end

      it "creates a 3x3 white image" do
        expect(image).to receive(:create).with(width: 3, height: 3)

        BitmapEditor.new(image).run('I 3 3')
      end

      it "creates a 3x9 white image" do
        expect(image).to receive(:create).with(width: 3, height: 9)

        BitmapEditor.new(image).run('I 3 9')
      end
    end

    context "with a poorly formatted command" do
      xit "returns an informative error" do # speak to PM to determine desired behaviour
        expect(image).to receive(:create).with(height: "a", width: "a")

        BitmapEditor.new(image).run('I a a')
      end
    end
  end

  describe "L X Y C" do
    context "with a well formatted command" do
      it "colours the pixel at 1 1 black" do
        expect(image).to receive(:add_colour).with(x: 1, y: 1, colour: "#000000")

        BitmapEditor.new(image).run('L 1 1 #000000')
      end

      it "colours the pixel at 2 9 red" do
        expect(image).to receive(:add_colour).with(x: 2, y: 9, colour: "#ff0000")

        BitmapEditor.new(image).run('L 2 9 #ff0000')
      end
    end
  end
end
