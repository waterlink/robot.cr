module Robot
  class BoardCommand
    private getter state, left, top

    def initialize(@state, args)
      @left, @top = args.map &.to_i
    end

    def call
      state.augment(board: Board.new(left, top))
    end
  end
end
