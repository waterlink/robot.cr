module Robot
  class ForwardCommand
    private getter state

    def initialize(@state)
    end

    def call
      state.augment(robot: robot.forward)
    end

    private delegate robot, state
  end
end
