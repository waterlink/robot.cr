module Robot
  class Dispatcher
    private getter routes :: Array(Route)

    def initialize(@routes)
    end

    def handle(line, state)
      routes
        .find(&.applicable?(line))
        .not_nil!
        .call(line, state)
    end

    class Route
      def self.build(command_class)
        DefaultRoute.new(command_class)
      end

      def self.build(name, command_class)
        SimpleRoute.new(name, command_class)
      end

      def self.build(name, args_count, command_class)
        ParametrizedRoute.new(name, args_count, command_class)
      end

      def applicable?(line)
        false
      end

      def call(line, state)
        state
      end
    end

    class DefaultRoute < Route
      private getter command_class

      def initialize(@command_class)
      end

      def applicable?(line)
        true
      end

      def call(line, state)
        command_class.new(state).call
      end
    end

    class SimpleRoute < Route
      private getter name, command_class

      def initialize(@name, @command_class)
      end

      def applicable?(line)
        line == name
      end

      def call(line, state)
        command_class.new(state).call
      end
    end

    class ParametrizedRoute < Route
      private getter name, args_count, command_class

      def initialize(@name, @args_count, @command_class)
      end

      def applicable?(line)
        command, args = line.split(" ")
        command == name &&
          args.split(",").count == args_count
      rescue IndexOutOfBounds
        false
      end

      def call(line, state)
        command, args = line.split(" ")
        command_class.new(state, args.split(",")).call
      end
    end
  end
end
