require "./view"

module Robot
  class InputController
    private getter board, robot

    def initialize
      @board = Board.new(10, 10)
      @robot = Robot.new
    end

    def handle(line)
      handle_report(line) ||
        handle_place(line) ||
        handle_forward(line) ||
        handle_left(line) ||
        handle_right(line) ||
        EmptyView.new
    end

    def handle_report(line)
      return unless line == "report"
      ReportCommand.new(robot).call
    end

    def handle_place(line)
      command, args = line.split(" ")
      if command == "place"
        left, top, direction = args.split(",")
        @robot = PlacedRobot.new(
          board,
          Position.new(left.to_i, top.to_i),
          Direction.from_name(direction),
        )
        nil
      end
    rescue IndexOutOfBounds
      nil
    end

    def handle_forward(line)
      return unless line == "forward"
      @robot = robot.forward
      nil
    end

    def handle_left(line)
      return unless line == "left"
      @robot = robot.left
      nil
    end

    def handle_right(line)
      return unless line == "right"
      @robot = robot.right
      nil
    end
  end

  view EmptyView[] do
    io << ""
  end
end
