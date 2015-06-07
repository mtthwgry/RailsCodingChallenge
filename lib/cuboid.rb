class Cuboid
  attr_reader :width, :length, :height, :origin
  attr_accessor :x, :y, :z

  def initialize(options={})
    @x = options.fetch(:x, 0)
    @y = options.fetch(:y, 0)
    @z = options.fetch(:z, 0)

    @width = options.fetch(:width)
    @length = options.fetch(:length)
    @height = options.fetch(:height)
  end

  def move_to!(x, y, z)
    self.x = x
    self.y = y
    self.z = z
  end

  def vertices
  end

  #returns true if the two cuboids intersect each other.  False otherwise.
  def intersects?(other)
  end
end