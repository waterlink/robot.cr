module Robot
  class State
    getter board, robot, view

    def initialize(@board, @robot, @view=EmptyView.new)
    end

    def augment(board=nil, robot=nil, view=nil)
      self.class.new(
        board || self.board,
        robot || self.robot,
        view || EmptyView.new,
      )
    end
  end
end
