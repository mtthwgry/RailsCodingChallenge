class Vertex
  attr_reader :x, :y, :z

  def initialize(x, y, z)
    @x = x
    @y = y
    @z = z
  end

  def >(other)
    x > other.x && y > other.y && z > other.z
  end
end