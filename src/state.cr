module Robot
  class State
    getter board, robot

    def initialize(@board, @robot)
    end

    def augment(board=nil, robot=nil)
      self.class.new(
        board || self.board,
        robot || self.robot,
      )
    end
  end
end
