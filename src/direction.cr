module Robot
  class Direction
    def self.north; build(0, -1, "north") end
    def self.east; build(1, 0, "east") end
    def self.south; build(0, 1, "south") end
    def self.west; build(-1, 0, "west") end

    protected getter left, top, name

    def initialize(@left, @top, @name)
    end

    def self.build(left, top, name)
      registry[name] ||= new(left, top, name)
    end

    def self.from_name(name)
      registry.fetch(name)
    end

    def ==(other : Direction)
      self.left == other.left &&
        self.top == other.top
    end

    def move(position)
      position.move(left, top)
    end

    def rotate_left
      rotations[previous_rotation]
    end

    def rotate_right
      rotations[next_rotation]
    end

    def build_view(view_factory)
      view_factory.build({ "name" => name })
    end

    private def previous_rotation
      (current_rotation - 1) % rotations.count
    end

    private def next_rotation
      (current_rotation + 1) % rotations.count
    end

    private def current_rotation
      (@_current_rotation ||= _current_rotation).not_nil!
    end

    private def _current_rotation
      rotations.index(self)
    end

    private def rotations
      self.class.rotations
    end

    private def self.registry
      @@registry
    end

    @@registry = {} of String => Direction

    protected def self.rotations
      @@rotations
    end

    @@rotations = [north, east, south, west]
  end
end
