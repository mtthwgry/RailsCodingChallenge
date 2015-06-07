require 'vertex'

describe Vertex do
  let(:vertex) { Vertex.new(x: 1, y: 2, z: 3) }

  describe '#x' do
    it "is readable" do
      expect(vertex.x).to be 1
    end
  end

  describe '#y' do
    it "is readable" do
      expect(vertex.y).to be 2
    end
  end

  describe '#z' do
    it "is readable" do
      expect(vertex.z).to be 3
    end
  end

  describe '#>' do
    context "when all coordinates are greater than the other's" do
      it "is true" do
        other_vertex = Vertex.new(x: 2, y: 3, z: 4)
        expect(other_vertex > vertex).to be true
      end
    end

    context "when only the x coordinate is greater than the other's" do
      it "is false" do
        other_vertex = Vertex.new(x: 2, y: 1, z: 2)
        expect(other_vertex > vertex).to be false
      end
    end

    context "when only the y coordinate is greater than the other's" do
      it "is false" do
        other_vertex = Vertex.new(x: 1, y: 4, z: 2)
        expect(other_vertex > vertex).to be false
      end
    end

    context "when only the z coordinate is greater than the other's" do
      it "is false" do
        other_vertex = Vertex.new(x: 1, y: 1, z: 5)
        expect(other_vertex > vertex).to be false
      end
    end
  end
end