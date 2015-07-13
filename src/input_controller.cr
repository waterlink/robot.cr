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

    private def new_state(line)
      handle_report(line) ||
        handle_place(line) ||
        handle_forward(line) ||
        handle_left(line) ||
        handle_right(line) ||
        state.augment
    end

    private def handle_report(line)
      return unless line == "report"
      @state = ReportCommand.new(state).call
    end

    private def handle_place(line)
      command, args = line.split(" ")
      return unless command == "place"
      PlaceCommand.new(state, args.split(",")).call
    rescue IndexOutOfBounds
      nil
    end

    private def handle_forward(line)
      return unless line == "forward"
      ForwardCommand.new(state).call
    end

    private def handle_left(line)
      return unless line == "left"
      LeftCommand.new(state).call
    end

    private def handle_right(line)
      return unless line == "right"
      RightCommand.new(state).call
    end

    private delegate robot, state
    private delegate board, state
  end

  view EmptyView[] do
    io << ""
  end
end
