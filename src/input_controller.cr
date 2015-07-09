require "./view"
require "./report_command"

module Robot
  class InputController
    def handle(line)
      return ReportCommand.new.call if line == "report"
      EmptyView.new
    end
  end

  view EmptyView do
    io << ""
  end
end
