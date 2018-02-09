require './lib/bitmap_editor'

RSpec.describe BitmapEditor do
  let(:image) { double :bitmap_image }

  subject { described_class.new(image).run("#{command} #{args}") }

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


    xcontext '0 x N' do
      let(:args) { '0 5' }

      it 'raise exception' do
        expect(image).not_to receive(:create)
        expect { subject }.to raise_error(BitmapEditor::WidthOutOfBounds)
      end
    end

    xcontext 'one of the args is negative' do
      let(:args) { '3 -5' }

      it 'raise exception' do
        expect(image).not_to receive(:create)
        expect { subject }.to raise_error(BitmapEditor::HeightOutOfBounds)
      end
    end

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
