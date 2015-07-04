require "./spec_helper"

module Robot
  describe InputController do
    describe "#handle" do
      it "ignores invalid command" do
        controller = InputController.new
        controller.handle("invalid command")
          .should eq(EmptyView.new)
      end

      it "works correctly with report command" do
        controller = InputController.new
        controller.handle("report")
          .should eq(ReportView.new)
      end
    end
  end
end
