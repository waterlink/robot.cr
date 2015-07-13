require "./view"

module Robot
  class InputController
    private getter state, dispatcher

    def initialize
      board = NullBoard.new
      robot = Robot.new
      @state = State.new(board, robot)
      @dispatcher = Dispatcher.new([
        Dispatcher::Route.build("board", 2, BoardCommand),
        Dispatcher::Route.build("place", 3, PlaceCommand),
        Dispatcher::Route.build("forward", ForwardCommand),
        Dispatcher::Route.build("left", LeftCommand),
        Dispatcher::Route.build("right", RightCommand),
        Dispatcher::Route.build("report", ReportCommand),
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
