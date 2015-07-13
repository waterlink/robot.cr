module Robot
  class Position
    protected getter left, top

    def initialize(@left, @top)
    end

    def ==(other : Position)
      self.left == other.left &&
        self.top == other.top
    end

    def move(left, top)
      self.class.new(
        self.left + left,
        self.top + top,
      )
    end

    def build_view(view_factory)
      view_factory.build({
        "left" => left,
        "top" => top,
      })
    end
  end
end
