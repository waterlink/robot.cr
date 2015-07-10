require "./cli"

module Robot
  class Robot
  end

  class PlacedRobot < Robot
    def initialize(@board, @position, @direction)
    end
  end
end
