require "./spec_helper"

module Robot
  describe ReportCommand do
    it "returns correct position of robot" do
      board = Board.new(10, 10)
      position = Position.new(3, 7)
      direction = Direction.west
      robot = PlacedRobot.new(board, position, direction)

      state = State.new(board, robot)
      command = ReportCommand.new(state)

      command.call.view.should eq(
        ReportView.new(position, direction)
      )

      command.call.view.to_s.should eq(
        "=> 3,7,west\n"
      )
    end

    it "returns empty view when robot is not placed" do
      board = Board.new(10, 10)
      robot = Robot.new
      state = State.new(board, robot)
      command = ReportCommand.new(state)
      command.call.view.should eq(EmptyView.new)
      command.call.view.to_s.should eq("")
    end
  end
end
