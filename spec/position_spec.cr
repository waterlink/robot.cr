require "./spec_helper"

module Robot
  describe Position do
    it "can be moved with #_move" do
      Position.new(5, 2)._move(-3, 6)
        .should eq(Position.new(2, 8))
    end
  end
end
