require "./spec_helper"

module Robot
  describe Cli do
    it "works correctly" do
      commands = [
        "board 6,6",
        "place 3,2,west",
        "forward",
        "right",
        "forward",
        "report",
      ]

      stdin = StringIO.new(commands.join("\n"))
      stdout = StringIO.new(capacity: 4096)
      cli = Cli.new(stdin: stdin, stdout: stdout)

      cli.start

      stdout.read.split("\n").should eq([
        "robot :001 > ",
        "robot :002 > ",
        "robot :003 > ",
        "robot :004 > ",
        "robot :005 > ",
        "robot :006 > ",
        "=> 2,1,north",
        "robot :007 > ",
        "exit",
      ])
    end
  end
end
