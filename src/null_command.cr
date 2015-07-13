module Robot
  class NullCommand
    private getter state

    def initialize(@state)
    end

    def call
      state.augment
    end
  end
end
