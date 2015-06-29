module Robot
  class InputController
    def handle(line)
      return ReportView.new if line == "report"
      EmptyView.new
    end
  end

  class ReportView
    def to_s(io)
      io << "=> 2,1,north\n"
    end
  end

  class EmptyView
    def to_s(io)
      io << ""
    end
  end
end
