module ActiveAdmin

  # Register ActiveAdmin Extension FloatAction
  class FloatAction

    include ActiveAdmin::OptionalDisplay

    attr_accessor :name, :options, :block

    def initialize(name, options = {}, &block)
      @name    = name.to_s
      @options = options
      @block   = block
      normalize_display_options!
    end

    # The id gets used for the div in the view
    def id
      "#{name.downcase.underscore}_float_action".parameterize
    end

    def custom_class
      options[:class]
    end

    def priority
      options[:priority] || 10
    end

  end

end
