require "./view"
require "./position"
require "./direction"

module Robot
  class ReportCommand
    def initialize(@robot)
    end

    def call
      ReportView.build({
        "position" => Position.new(2, 1),
        "direction" => Direction.north,
      })
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
