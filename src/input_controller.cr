require "./view"

module Robot
  class InputController
    private getter state

    def initialize
      board = Board.new(10, 10)
      robot = Robot.new
      @state = State.new(board, robot)
    end

    def handle(line)
      @state = new_state(line)
      state.view
    end

    def new_state(line)
      handle_report(line) ||
        handle_place(line) ||
        handle_forward(line) ||
        handle_left(line) ||
        handle_right(line) ||
        state.augment
    end

    def handle_report(line)
      return unless line == "report"
      @state = ReportCommand.new(state).call
    end

    def handle_place(line)
      command, args = line.split(" ")
      return unless command == "place"
      PlaceCommand.new(state, args.split(",")).call
    rescue IndexOutOfBounds
      nil
    end

    def handle_forward(line)
      return unless line == "forward"
      state.augment(robot: state.robot.forward)
    end

    def handle_left(line)
      return unless line == "left"
      state.augment(robot: state.robot.left)
    end

    def handle_right(line)
      return unless line == "right"
      state.augment(robot: state.robot.right)
    end
  end

  view EmptyView[] do
    io << ""
  end
end
