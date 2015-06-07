require_relative 'vertex.rb'

class Cuboid
  attr_reader :width, :length, :height
  attr_writer :vertices
  attr_accessor :origin

  def initialize(options={})
    @origin = Vertex.new(options[:x], options[:y], options[:z])

    @width = options.fetch(:width)
    @length = options.fetch(:length)
    @height = options.fetch(:height)
  end

  def move_to!(x, y, z)
    origin = Vertex.new(x, y, z)
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
    max_width = origin.x + width
    max_length = origin.z + length

    vertices = []
    vertices << Vertex.new(x, y, z) # front-bottom-left
    vertices << Vertex.new(x, max_height, z) # front-top-left
    vertices << Vertex.new(max_width, y, z) # front-bottom-right
    vertices << Vertex.new(max_width, max_height, z) # front-top-right
    vertices << Vertex.new(x, y, max_length) # rear-bottom-left
    vertices << Vertex.new(x, max_height, max_length) # rear-top-left
    vertices << Vertex.new(max_width, y, max_length) # rear-bottom-right
    vertices << Vertex.new(max_width, max_height, max_length) # rear-top-right

    vertices
  end
end