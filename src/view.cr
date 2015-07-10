module Robot
  macro view(definition, &block)
    {% name = definition.receiver %}
    {% params = definition.args %}

    struct {{name.id}}
      {{
        params.map do |param|
          "protected getter #{param.id}".id
        end.join("\n").id
      }}

      def initialize({{ params.map { |p| "@#{p.id}".id }.argify }})
      end

      def to_s(io)
        {{ block.body }}
      end

      def ==(other : {{ name.id }})
        ({{
          params.map do |param|
            "self.#{param.id} == other.#{param.id}".id
          end
        }} of Bool).all?
      end

      def ==(other)
        false
      end
    end
  end
end
