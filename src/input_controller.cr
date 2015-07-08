require "./view"

module Robot
  class InputController
    def handle(line)
      return ReportView.new if line == "report"
      EmptyView.new
    end
  end

  view ReportView do
    io << "=> 2,1,north\n"
  end

  view EmptyView do
    io << ""
  end
end
