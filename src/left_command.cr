module Robot
  class LeftCommand
    private getter state

    def initialize(@state)
    end

    def call
      state.augment(robot: robot.left)
    end

    private delegate robot, state
  end
end
