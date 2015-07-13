require "./view"

module Robot
  class InputController
    private getter board, robot, state

    def initialize
      @board = Board.new(10, 10)
      @robot = Robot.new
      @state = State.new(board, robot)
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
      return unless command == "place"
      left, top, direction = args.split(",")
      @state = PlaceCommand.new(state, args.split(",")).call
      @robot = state.robot
      nil
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
