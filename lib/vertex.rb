class Vertex
  attr_reader :x, :y, :z

  def initialize(x, y, z)
    @x = x || 0
    @y = y || 0
    @z = z || 0
  end

  def >(other)
    x > other.x && y > other.y && z > other.z
  end
end