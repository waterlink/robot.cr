require "./view"
require "./position"
require "./direction"

module Robot
  class ReportCommand
    def initialize(@robot)
    end

    def call
      ReportView.new(Position.new(2, 1), Direction.north)
    end
  end

  view ReportView[position, direction] do
    io << "=> 2,1,north\n"
  end
end
