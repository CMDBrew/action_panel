module ActionPanel

  # Finds Config Component Class
  module ConfigsFinder

    class ConfigError < StandardError; end

    FILTER_OPTS = %w[sidebar table_tools].freeze

    def component_class(*args)
      components_configs.component_class.dig(*args).to_s
    rescue TypeError => _e
      raise ConfigError, "Invalid component_class configs: #{args.join(' -> ')}"
    end

    private

    def components_configs
      active_admin_config
    rescue StandardError => e
      Rails.logger.info "#{e.class}: active_admin_config is not available for #{self.class}"
      ActiveAdmin.application
    end

  end

end
