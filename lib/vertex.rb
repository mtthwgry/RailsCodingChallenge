class Vertex
  attr_reader :x, :y, :z

  def initialize(options={})
    @x = options.fetch(:x)
    @y = options.fetch(:y)
    @z = options.fetch(:z)
  end

  def >(other)
    x > other.x && y > other.y && z > other.z
  end

  def coordinates
    @coordinates ||= [x, y, z]
  end
end