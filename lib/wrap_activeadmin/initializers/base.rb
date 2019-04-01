module WrapActiveAdmin

  module Initializers

    # Base Initializers
    module Base

      def require_each(files, path: nil)
        file_path = ['../extensions/', path].reject(&:blank?).join('/')
        files.each { |x| require_relative("#{file_path}/#{x}") }
      end

    end

  end

end
