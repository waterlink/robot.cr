require "./*"

module Robot
  class Robot
    def build_view(view_factory)
      EmptyView.new
    end
  end

  class PlacedRobot < Robot
    private getter board, position, direction

    def initialize(@board, @position, @direction)
    end

    def build_view(view_factory)
      view_factory.build({
        "position" => position,
        "direction" => direction,
      })
    end
  end
end
