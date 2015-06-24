module Robot
  class Cli
    getter stdin
    getter stdout
    getter counter

    def initialize(@stdin = STDIN, @stdout = STDOUT)
      @counter = 0
    end

    def start
      prompt
      stdin.each_line do |line|
        if line.strip == "report"
          stdout.puts("=> 2,1,north")
        end
        prompt
      end
      stdout.puts("exit")
    end

    private def increase_counter
      @counter += 1
    end

    private def prompt
      increase_counter
      stdout.printf("robot :%03d > ", counter)
    end
  end
end
