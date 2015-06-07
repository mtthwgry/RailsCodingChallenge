require 'cuboid'

#This test is incomplete and, in fact, won't even run without errors.
#  Do whatever you need to do to make it work and please add your own test cases for as many
#  methods as you feel need coverage
describe Cuboid do
  let(:cuboid) { Cuboid.new(x: 1, y: 2, z: 3, width: 5, length: 6, height: 7) }

  describe "Initialization" do
    context "when not given coordinates" do
      let(:cuboid) { Cuboid.new(width: 1, length: 1, height: 1) }
      it "sets x to a default coordinate" do
        expect(cuboid.x).to eq 0
      end

      it "sets y to a default coordinate" do
        expect(cuboid.y).to eq 0
      end

      it "sets z to a default coordinate" do
        expect(cuboid.z).to eq 0
      end
    end
  end

  describe '#width' do
    it "is readable" do
      expect(cuboid.width).to eq 5
    end
  end

  describe '#length' do
    it "is readable" do
      expect(cuboid.length).to eq 6
    end
  end

  describe '#height' do
    it "is readable" do
      expect(cuboid.height).to eq 7
    end
  end

  describe '#move_to!' do
    it "changes the x origin to the specified coordinate" do
      expect{ cuboid.move_to!(9, 10, 11) }.to change{cuboid.x}.from(1).to(9)
    end

    it "changes the y origin to the specified coordinate" do
      expect{ cuboid.move_to!(9, 10, 11) }.to change{cuboid.y}.from(2).to(10)
    end

    it "changes the z origin to the specified coordinate" do
      expect{ cuboid.move_to!(9, 10, 11) }.to change{cuboid.z}.from(3).to(11)
    end
  end

  describe '#vertices' do
    let(:cuboid) { Cuboid.new(width: 4, length: 10, height: 2) }

    it "is an array" do
      expect(cuboid.vertices).to be_an(Array)
    end

    it "has 8 vertices" do
      expect(cuboid.vertices.length).to eq 8
    end

    it "has the front-bottom-left vertex" do
      expect(cuboid.vertices).to include([0, 0, 0])
    end

    it "has the front-top-left vertex" do
      expect(cuboid.vertices).to include([0, 2, 0])
    end

    it "has the front-bottom-right vertex" do
      expect(cuboid.vertices).to include([4, 0, 0])
    end

    it "has the front-top-right vertex" do
      expect(cuboid.vertices).to include([4, 2, 0])
    end

    it "has the rear-bottom-left vertex" do
      expect(cuboid.vertices).to include([0, 0, 10])
    end

    it "has the rear-top-left vertex" do
      expect(cuboid.vertices).to include([0, 2, 10])
    end

    it "has the rear-bottom-right vertex" do
      expect(cuboid.vertices).to include([4, 0, 10])
    end

    it "has the rear-top-right vertex" do
      expect(cuboid.vertices).to include([4, 2, 10])
    end
  end

  describe '#intersects?' do
  end

end
