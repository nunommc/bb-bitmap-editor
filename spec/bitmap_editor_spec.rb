require './lib/bitmap_editor'

RSpec.describe BitmapEditor do
  let(:image) { double :bitmap_image }

  subject { described_class.new(image).run("#{command} #{args}") }

  describe 'paint image' do
    context 'paint pixel' do 
      let(:command) { 'L' }
      context '1x1' do
        let(:args) { '1 1 A' }
        let(:pixel) { OpenStruct.new(x: 1, y: 1) }
        it 'paints pixel 1,1 with the specified colour' do
          expect(image).to receive(:paint_pixel).with(pixel: pixel, colour: 'A')
          subject
        end
      end

      context '2x3' do
        let(:args) { '2 3 C' }
        let(:pixel) { OpenStruct.new(x: 2, y: 3) }
        it 'paints pixel 2,3 with the specified colour' do
          expect(image).to receive(:paint_pixel).with(pixel: pixel, colour: 'C')
          subject
        end
      end
    end

    context 'paint vertical segment' do 
      let(:command) { 'V' }
      context 'V 1 1 3 C ' do
        let(:args) { '1 1 3 C' } 
        it 'paints vertical segment 1,1,3 with colour C' do
          expect(image).to receive(:paint_vertical_segment)
                           .with(x:1, y1: 1, y2: 3, colour: 'C')
          subject
        end
      end

      context 'V 2 3 7 G' do
        let(:args) { '2 3 7 G' } 
        it 'paints vertical segment 2,3,7 with colour G' do
          expect(image).to receive(:paint_vertical_segment)
                           .with(x:2, y1: 3, y2: 7, colour: 'G')
          subject
        end
      end
    end

    context 'paint horizontal segment' do 
      let(:command) { 'H' }
      context 'H 1 1 3 C ' do
        let(:args) { '1 1 3 C' } 
        it 'paints horizontal segment 1,1,3 with colour C' do
          expect(image).to receive(:paint_horizontal_segment)
                           .with(x1:1, x2: 1, y1: 3, colour: 'C')
          subject
        end
      end

      context 'H 2 3 7 G' do
        let(:args) { '2 3 7 G' } 
        it 'paints horizontal segment 2,3,7 with colour G' do
          expect(image).to receive(:paint_horizontal_segment)
                           .with(x1:2, x2: 3, y1: 7, colour: 'G')
          subject
        end
      end
    end

  end



  describe 'create image' do
    let(:command) { 'I' }

    context '1x1' do
      let(:args) { '1 1' }
      it 'creates a 1 x 1 image' do
        expect(image).to receive(:create).with(width: 1, height: 1)
        subject
      end
    end

    context '2 x 1' do
      let(:args) { '2 1' }

      it 'creates a 2 x 1 image' do
        expect(image).to receive(:create).with(width: 2, height: 1)
        subject
      end
    end

    context '3 x 4' do
      let(:args) { '3 4' }

      it 'creates a 3 x 4 image' do
        expect(image).to receive(:create).with(width: 3, height: 4)
        subject
      end
    end


    # xcontext '0 x N' do
    #   let(:args) { '0 5' }

    #   it 'raise exception' do
    #     expect(image).not_to receive(:create)
    #     expect { subject }.to raise_error(BitmapEditor::WidthOutOfBounds)
    #   end
    # end

    # xcontext 'one of the args is negative' do
    #   let(:args) { '3 -5' }

    #   it 'raise exception' do
    #     expect(image).not_to receive(:create)
    #     expect { subject }.to raise_error(BitmapEditor::HeightOutOfBounds)
    #   end
    # end

    context '251xN'
    context 'Nx251'
    context 'when there is an existing image'

    context 'when is lower cased' do
      let(:command) { 'i' }
      let(:args) { '2 1' }

      it 'creates a 2 x 1 image' do
        expect(image).to receive(:create).with(width: 2, height: 1)
        subject
      end
    end
  end
end
