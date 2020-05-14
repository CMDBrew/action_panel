module ActiveAdminBootstrap

  # Finds Config Component Class
  module ConfigsFinder

    class ConfigError < StandardError; end

    def component_class(*args)
      active_admin_config.component_class.dig(*args).to_s
    rescue TypeError => _e
      raise ConfigError, "Invalid component_class configs: #{args.join(' -> ')}"
    end

  end

end
