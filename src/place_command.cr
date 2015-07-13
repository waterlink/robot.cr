module Robot
  class PlaceCommand
    private getter state, left, top, direction

    def initialize(@state, args)
      @left = args[0].to_i
      @top = args[1].to_i
      @direction = args[2]
    end

    def call
      state.augment(robot: PlacedRobot.new(
        state.board,
        Position.new(left, top),
        Direction.from_name(direction),
      ))
    end
  end
end
