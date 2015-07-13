require "./*"

module Robot
  class Robot
    def build_view(view_factory)
      EmptyView.new
    end

    def forward; self end
    def left; self end
    def right; self end
  end

  class PlacedRobot < Robot
    protected getter board, position, direction

    def initialize(@board, @position, @direction)
    end

    def ==(other : PlacedRobot)
      self.board == other.board &&
        self.position == other.position &&
        self.direction == other.direction
    end

    def forward
      self.class.new(
        board,
        direction.move(position),
        direction,
      )
    end

    def left
      self.class.new(
        board,
        position,
        direction.rotate_left,
      )
    end

    def right
      self.class.new(
        board,
        position,
        direction.rotate_right,
      )
    end

    def build_view(view_factory)
      view_factory.build({
        "position" => position,
        "direction" => direction,
      })
    end
  end
end
