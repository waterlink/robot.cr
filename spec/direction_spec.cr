require "./spec_helper"

module Robot
  describe Direction do
    it "comes with pre-built directions" do
      Direction.build(0, -1, "north").should be(Direction.north)
      Direction.build(1, 0, "east").should be(Direction.east)
      Direction.build(0, 1, "south").should be(Direction.south)
      Direction.build(-1, 0, "west").should be(Direction.west)
    end

    describe "#rotate_left" do
      it "returns counterclockwise rotation" do
        Direction.north.rotate_left.should eq Direction.west
        Direction.east.rotate_left.should eq Direction.north
        Direction.south.rotate_left.should eq Direction.east
        Direction.west.rotate_left.should eq Direction.south
      end
    end

    describe "#rotate_right" do
      it "returns clockwise rotation" do
        Direction.north.rotate_right.should eq Direction.east
        Direction.east.rotate_right.should eq Direction.south
        Direction.south.rotate_right.should eq Direction.west
        Direction.west.rotate_right.should eq Direction.north
      end
    end

    describe "#move" do
      it "returns correct changed position" do
        Direction.north.move(Position.new(3, 5))
          .should eq(Position.new(3, 4))

        Direction.east.move(Position.new(3, 5))
          .should eq(Position.new(4, 5))

        Direction.south.move(Position.new(3, 5))
          .should eq(Position.new(3, 6))

        Direction.west.move(Position.new(3, 5))
          .should eq(Position.new(2, 5))
      end
    end
  end
end
