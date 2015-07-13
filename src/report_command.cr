module Robot
  class ReportCommand
    private getter state

    def initialize(@state)
    end

    def call
      state.augment(view: robot.build_view(ReportView))
    end

    delegate robot, state
  end

  view ReportView[position, direction] do
    position_view = position.build_view(PositionView)
    direction_view = direction.build_view(DirectionView)
    io << "=> #{position_view},#{direction_view}\n"
  end

  view PositionView[left, top] do
    io << "#{left},#{top}"
  end

  view DirectionView[name] do
    io << name
  end
end
