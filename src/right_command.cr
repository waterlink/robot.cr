module Robot
  class RightCommand
    private getter state

    def initialize(@state)
    end

    def call
      state.augment(robot: robot.right)
    end

    private delegate robot, state
  end
end
