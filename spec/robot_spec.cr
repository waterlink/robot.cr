require "./spec_helper"

module Robot
  describe Robot do
    it "is not equal to placed robot" do
      board = Board.new(10, 10)
      Robot.new.should_not eq(PlacedRobot.new(
        board,
        Position.new(3, 4),
        Direction.west,
      ))
    end

    it "ignores #forward, #left and #right" do
      robot = Robot.new
      robot.forward.should be robot
      robot.left.should be robot
      robot.right.should be robot
    end
  end

  describe PlacedRobot do
    board = Board.new(10, 10)
    robot = PlacedRobot.new(
      board,
      Position.new(3, 4),
      Direction.east,
    )

    it "is not equal to non-placed robot" do
      robot.should_not eq Robot.new
    end

    describe "#forward" do
      it "moves in the specified direction" do
        robot.forward.should eq(PlacedRobot.new(
          board,
          Position.new(4, 4),
          Direction.east,
        ))
      end
    end

    describe "#left" do
      it "rotates robot counterclockwise" do
        robot.left.should eq(PlacedRobot.new(
          board,
          Position.new(3, 4),
          Direction.north,
        ))
      end
    end

    describe "#right" do
      it "rotates robot clockwise" do
        robot.right.should eq(PlacedRobot.new(
          board,
          Position.new(3, 4),
          Direction.south,
        ))
      end
    end
  end
end
