require "./spec_helper"

module Robot
  describe Cli do
    it "works correctly with readme example" do
      commands = [
        "board 6,6",
        "place 3,2,west",
        "forward",
        "right",
        "forward",
        "report",
      ]

      stdin = StringIO.new(commands.join("\n") + "\n")
      stdout = StringIO.new(capacity: 4096)
      cli = Cli.new(stdin: stdin, stdout: stdout)

      cli.start

      stdout.read.should eq([
        "robot :001 > ",
        "robot :002 > ",
        "robot :003 > ",
        "robot :004 > ",
        "robot :005 > ",
        "robot :006 > ",
        "=> 2,1,north\n",
        "robot :007 > ",
        "exit\n",
      ].join)
    end

    it "works correctly with slightly different example" do
      commands = [
        "board 6,6",
        "place 3,2,east",
        "forward",
        "left",
        "forward",
        "report",
      ]

      stdin = StringIO.new(commands.join("\n") + "\n")
      stdout = StringIO.new(capacity: 4096)
      cli = Cli.new(stdin: stdin, stdout: stdout)

      cli.start

      stdout.read.should eq([
        "robot :001 > ",
        "robot :002 > ",
        "robot :003 > ",
        "robot :004 > ",
        "robot :005 > ",
        "robot :006 > ",
        "=> 4,1,north\n",
        "robot :007 > ",
        "exit\n",
      ].join)
    end

    it "ignores everything if robot have not been placed" do
      commands = [
        "board 6,6",
        "forward",
        "left",
        "forward",
        "report",
      ]

      stdin = StringIO.new(commands.join("\n") + "\n")
      stdout = StringIO.new(capacity: 4096)
      cli = Cli.new(stdin: stdin, stdout: stdout)

      cli.start

      stdout.read.should eq([
        "robot :001 > ",
        "robot :002 > ",
        "robot :003 > ",
        "robot :004 > ",
        "robot :005 > ",
        "robot :006 > ",
        "exit\n",
      ].join)
    end

    it "ignores everything if board have not been placed" do
      commands = [
        "place 3,2,east",
        "forward",
        "left",
        "forward",
        "report",
      ]

      stdin = StringIO.new(commands.join("\n") + "\n")
      stdout = StringIO.new(capacity: 4096)
      cli = Cli.new(stdin: stdin, stdout: stdout)

      cli.start

      stdout.read.should eq([
        "robot :001 > ",
        "robot :002 > ",
        "robot :003 > ",
        "robot :004 > ",
        "robot :005 > ",
        "robot :006 > ",
        "exit\n",
      ].join)
    end
  end
end
