require "./view"

module Robot
  class InputController
    private getter state, dispatcher

    def initialize
      board = Board.new(10, 10)
      robot = Robot.new
      @state = State.new(board, robot)
      @dispatcher = Dispatcher.new([
        Dispatcher::Route.build("report", ReportCommand),
        Dispatcher::Route.build("place", 3, PlaceCommand),
        Dispatcher::Route.build("forward", ForwardCommand),
        Dispatcher::Route.build("left", LeftCommand),
        Dispatcher::Route.build("right", RightCommand),
        Dispatcher::Route.build(NullCommand),
      ])
    end

    def handle(line)
      @state = dispatcher.handle(line, state)
      state.view
    end
  end

  view EmptyView[] do
    io << ""
  end
end
