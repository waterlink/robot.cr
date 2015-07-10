module Robot
  class Direction
    def self.north; new(0, -1) end
    def self.east; new(1, 0) end
    def self.south; new(0, 1) end
    def self.west; new(-1, 0) end

    def initialize(@left, @top)
    end
  end
end
