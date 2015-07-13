module Robot
  macro view(definition, &block)
    {% name = definition.receiver %}
    {% params = definition.args %}

    struct {{name.id}}
      {% unless params.empty? %}
      protected getter {{ params.argify }}
      {% end %}

      def initialize({{ params.map { |p| "@#{p.id}".id }.argify }})
      end

      def self.build(hash)
        new({{ params.map { |p| "hash.fetch(\"#{p.id}\")".id }.argify }})
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
