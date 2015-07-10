module Robot
  class Position
    protected getter left, top

    def initialize(@left, @top)
    end

    def ==(other : Position)
      self.left == other.left &&
        self.top == other.top
    end
  end
end
