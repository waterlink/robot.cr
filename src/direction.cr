module Robot
  class Direction
    def self.north; new(0, -1, "north") end
    def self.east; new(1, 0, "east") end
    def self.south; new(0, 1, "south") end
    def self.west; new(-1, 0, "west") end

    protected getter left, top, name

    def initialize(@left, @top, @name)
    end

    def ==(other : Direction)
      self.left == other.left &&
        self.top == other.top
    end

    def build_view(view_factory)
      view_factory.build({ "name" => name })
    end
  end
end
