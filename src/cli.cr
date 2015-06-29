require "./input_controller"

module Robot
  class Cli
    private getter stdin
    private getter stdout
    private getter counter
    private getter input_controller

    def initialize(@stdin = STDIN, @stdout = STDOUT)
      @counter = 0
      @input_controller = InputController.new
    end

    def start
      prompt
      stdin.each_line do |line|
        render(input_controller.handle(line.strip))
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
      stdout.flush
    end

    private def render(view)
      stdout.print(view.to_s)
    end
  end
end
