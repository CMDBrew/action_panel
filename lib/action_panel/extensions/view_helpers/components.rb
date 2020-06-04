module ViewHelpers

  # ViewHelpers Components
  module Components

    def footer(namespace)
      Arbre::Context.new({}, self) do
        footer namespace
      end.content
    end

  end

end
