require 'vertex'

class Cuboid
  attr_reader :width, :length, :height
  attr_writer :vertices
  attr_accessor :origin

  def initialize(options={})
    @origin = Vertex.new(
      x: options.fetch(:x, 0),
      y: options.fetch(:y, 0),
      z: options.fetch(:z, 0)
    )

    @width  = options.fetch(:width)
    @length = options.fetch(:length)
    @height = options.fetch(:height)
  end

  def move_to!(x, y, z)
    self.origin = Vertex.new(x: x, y: y, z: z)
    vertices = generate_vertices
  end

  def vertices
    @vertices ||= generate_vertices
  end

  #returns true if the two cuboids intersect each other, false otherwise.
  def intersects?(other)
    vertices.each do |vertex|
      return true if vertex > other.origin
    end
    false
  end

  private

  def generate_vertices
    max_height = origin.y + height
    max_width  = origin.x + width
    max_length = origin.z + length

    vertices = []
    vertices << Vertex.new(x: origin.x,  y: origin.y,   z: origin.z) # front-bottom-left
    vertices << Vertex.new(x: origin.x,  y: max_height, z: origin.z) # front-top-left
    vertices << Vertex.new(x: max_width, y: origin.y,   z: origin.z) # front-bottom-right
    vertices << Vertex.new(x: max_width, y: max_height, z: origin.z) # front-top-right
    vertices << Vertex.new(x: origin.x,  y: origin.y,   z: max_length) # rear-bottom-left
    vertices << Vertex.new(x: origin.x,  y: max_height, z: max_length) # rear-top-left
    vertices << Vertex.new(x: max_width, y: origin.y,   z: max_length) # rear-bottom-right
    vertices << Vertex.new(x: max_width, y: max_height, z: max_length) # rear-top-right

    vertices
  end
end