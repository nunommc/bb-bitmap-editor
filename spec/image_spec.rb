require './lib/image'

RSpec.describe Image do
  describe "create" do
    context "2x2" do
      let(:image) { Image.new.create(width: 2, height: 2) }
      it "creates a new MxN image with all pixels white(O)" do
        expect(image).to eq([["O", "O"], ["O", "O"]])
      end
    end

    context "1x3" do
      let(:image) { Image.new.create(width: 1, height: 3) }
      it "creates a new MxN image with all pixels white(O)" do
        expect(image).to eq([["O"], ["O"], ["O"]])
      end
    end
  end

  describe "paint pixel" do
    context "paint 1,2" do
      
    end
  end
end