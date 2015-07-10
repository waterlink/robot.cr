require "./spec_helper"
require "../src/board"
require "../src/position"
require "../src/direction"

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
  end
end
