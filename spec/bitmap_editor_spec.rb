require_relative '../app/bitmap_editor'

describe BitmapEditor do
  describe "I M N" do
    context "with a well formatted command" do
      it "creates a 2x2 white image" do
        image = double :image
        expect(image).to receive(:create).with(width: 2, height: 2)

        BitmapEditor.new(image).run('I 2 2')
      end

      it "creates a 3x3 white image" do
        image = double :image
        expect(image).to receive(:create).with(width: 3, height: 3)

        BitmapEditor.new(image).run('I 3 3')
      end

      it "creates a 3x9 white image" do
        image = double :image
        expect(image).to receive(:create).with(width: 3, height: 9)

        BitmapEditor.new(image).run('I 3 9')
      end
    end

    context "with a poorly formatted command" do
      xit "returns an informative error" do # speak to PM to determine desired behaviour
        image = double :image
        expect(image).to receive(:create).with(height: "a", width: "a")

        BitmapEditor.new(image).run('I a a')
      end
    end
  end
end
