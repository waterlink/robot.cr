require "./view"

module Robot
  class ReportCommand
    def call
      ReportView.new
    end
  end

  view ReportView do
    io << "=> 2,1,north\n"
  end
end
