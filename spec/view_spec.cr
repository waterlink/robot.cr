require "./spec_helper"

module Robot
  view TestView, [hello, world] do
    io << "hello: #{hello}, world: #{world}"
  end

  view EmptyTestView do
    io << ""
  end

  describe TestView do
    it "works correctly" do
      TestView.new("hi", "earth").to_s
        .should eq("hello: hi, world: earth")
    end

    it "handles equality correctly" do
      TestView.new("hi", "earth")
        .should eq(TestView.new("hi", "earth"))

      TestView.new("hi", "earth")
        .should_not eq(TestView.new("hello", "earth"))
      TestView.new("hi", "earth")
        .should_not eq(TestView.new("hi", "world"))

      TestView.new("hi", "earth")
        .should_not eq(EmptyTestView.new)
    end
  end

  describe EmptyTestView do
    it "works correctly" do
      EmptyTestView.new.to_s.should eq("")
    end

    it "handles equality correctly" do
      EmptyTestView.new.should eq(EmptyTestView.new)
      EmptyTestView.new.should_not eq(["hello world"])
    end
  end
end
