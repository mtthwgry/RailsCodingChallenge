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
    @vertices ||= generate_vertices
  end

  #returns true if the two cuboids intersect each other.  False otherwise.
  def intersects?(other)
  end

  private

  def generate_vertices
    max_height = y + height
    max_width = x + width
    max_length = z + length

    vertices = []
    vertices << [x, y, z]
    vertices << [x, max_height, z]
    vertices << [max_width, y, z]
    vertices << [max_width, max_height, z]
    vertices << [x, y, max_length]
    vertices << [x, max_height, max_length]
    vertices << [max_width, y, max_length]
    vertices << [max_width, max_height, max_length]

    vertices
  end
end