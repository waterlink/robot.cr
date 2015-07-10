require "./view"
require "./report_command"

module Robot
  class InputController
    private getter robot

    def initialize
      @robot = Robot.new
    end

    def handle(line)
      return ReportCommand.new(robot).call if line == "report"
      EmptyView.new
    end
  end

  view EmptyView[] do
    io << ""
  end
end
