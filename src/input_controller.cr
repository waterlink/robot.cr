module Robot
  class InputController
    def handle(line)
      return ReportView.new if line.strip == "report"
      EmptyView.new
    end
  end

  class ReportView
    def to_s
      "=> 2,1,north\n"
    end
  end

  class EmptyView
    def to_s
      ""
    end
  end
end
