require "./view"

module Robot
  class InputController
    private getter board, robot

    def initialize
      @board = Board.new(10, 10)
      @robot = PlacedRobot.new(
        board,
        Position.new(2, 1),
        Direction.north,
      )
    end

    def handle(line)
      return ReportCommand.new(robot).call if line == "report"
      EmptyView.new
    end
  end

  view EmptyView[] do
    io << ""
  end
end
