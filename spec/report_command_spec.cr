require "./spec_helper"

module Robot
  describe ReportCommand do
    it "returns correct position of robot" do
      board = Board.new(10, 10)
      position = Position.new(3, 7)
      direction = Direction.west

      robot = PlacedRobot.new(board, position, direction)
      command = ReportCommand.new(robot)

      command.call.should eq(
        ReportView.new(position, direction)
      )

      command.call.to_s.should eq(
        "=> 3,7,west\n"
      )
    end

    it "returns empty view when robot is not placed" do
      robot = Robot.new
      command = ReportCommand.new(robot)
      command.call.should eq(EmptyView.new)
      command.call.to_s.should eq("")
    end
  end
end
