require 'cuboid'

describe Cuboid do
  let(:cuboid) { Cuboid.new(x: 1, y: 2, z: 3, width: 5, length: 6, height: 7) }

  describe "creation" do
    it "creates a Vertex object as its origin" do
      expect(cuboid.origin).to be_a(Vertex)
    end

    it "has the proper coordinates at its origin" do
      expect(cuboid.origin.coordinates).to eq [1, 2, 3]
    end

    context "and not given an origin vertex" do
      let(:cuboid) { Cuboid.new(width: 1, length: 1, height: 1) }

      it "sets x to a default coordinate" do
        expect(cuboid.origin.x).to eq(0)
      end

      it "sets y to a default coordinate" do
        expect(cuboid.origin.y).to eq(0)
      end

      it "sets z to a default coordinate" do
        expect(cuboid.origin.z).to eq(0)
      end
    end
  end

  describe '#move_to!' do
    it "changes the x origin to the specified coordinate" do
      expect{ cuboid.move_to!(9, 10, 11) }.to change{ cuboid.origin.x }.from(1).to(9)
    end

    it "changes the y origin to the specified coordinate" do
      expect{ cuboid.move_to!(9, 10, 11) }.to change{ cuboid.origin.y }.from(2).to(10)
    end

    it "changes the z origin to the specified coordinate" do
      expect{ cuboid.move_to!(9, 10, 11) }.to change{ cuboid.origin.z }.from(3).to(11)
    end
  end

  describe '#vertices' do
    let(:cuboid) { Cuboid.new(width: 4, length: 10, height: 2) }
    let(:vertices) { cuboid.vertices.map(&:coordinates) }

    it "is an array" do
      expect(cuboid.vertices).to be_an(Array)
    end

    it "has 8 objects" do
      expect(cuboid.vertices.length).to eq(8)
    end

    it "contains only Vertex objects" do
      expect(cuboid.vertices).to all be_a(Vertex)
    end

    it "has the front-bottom-left vertex" do
      expect(vertices).to include [0, 0, 0]
    end

    it "has the front-top-left vertex" do
      expect(vertices).to include [0, 2, 0]
    end

    it "has the front-bottom-right vertex" do
      expect(vertices).to include [4, 0, 0]
    end

    it "has the front-top-right vertex" do
      expect(vertices).to include [4, 2, 0]
    end

    it "has the rear-bottom-left vertex" do
      expect(vertices).to include [0, 0, 10]
    end

    it "has the rear-top-left vertex" do
      expect(vertices).to include [0, 2, 10]
    end

    it "has the rear-bottom-right vertex" do
      expect(vertices).to include [4, 0, 10]
    end

    it "has the rear-top-right vertex" do
      expect(vertices).to include [4, 2, 10]
    end
  end

  describe '#intersects?' do
    let(:cuboid) { Cuboid.new(width: 10, length: 10, height: 3) }
    let(:intersecting_cuboid) { Cuboid.new(width: 4, length: 6, height: 5) }
    let(:nonintersecting_cuboid) { Cuboid.new(y: 3, width: 4, length: 10, height: 2) }

    context "given another Cuboid with the same origin" do
      it "is true" do
        expect(cuboid.intersects?(intersecting_cuboid)).to be(true)
      end
    end

    context "given another Cuboid with a different origin" do
      context "that isn't intersecting" do
        it "is false" do
          expect(cuboid.intersects?(nonintersecting_cuboid)).to be(false)
        end

        context "swapped with the other cuboid" do
          it "is false" do
            expect(nonintersecting_cuboid.intersects?(cuboid)).to be(false)
          end
        end
      end

      context "that is intersecting" do
        before { intersecting_cuboid.move_to!(3, 2, 1) }

        it "is true" do
          expect(cuboid.intersects?(intersecting_cuboid)).to be(true)
        end

        context "swapped with the other cuboid" do
          it "is true" do
            expect(intersecting_cuboid.intersects?(cuboid)).to be(true)
          end
        end
      end
    end
  end
end
