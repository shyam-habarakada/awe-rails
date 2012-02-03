# Configure Rails 3.1 to have assert_select_jquery() in tests
module Awe
  module Rails

    class Engine < ::Rails::Engine
      config.before_configuration do
        require "awe/assert_select" if ::Rails.env.test?
      end
    end

  end
end
