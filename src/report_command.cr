module Robot
  class ReportCommand
    private getter robot

    def initialize(@robot)
    end

    def call
      robot.build_view(ReportView)
    end
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
