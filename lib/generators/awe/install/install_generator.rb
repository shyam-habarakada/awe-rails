require 'rails'

module Awe
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      desc "This generator installs AWE (Artefact Web Extensions) into rails"
      source_root File.expand_path('../../../../../vendor/assets/javascripts', __FILE__)

      def copy_awe
        say_status("copying", "awe files", :green)
        if ::Rails.application.config.assets.enabled         
          copy_file "awe-core.js", "vendor/assets/javascripts/awe-core.js"
          copy_file "awe-state-machine.js", "vendor/assets/javascripts/awe-state-machine.js"
        else
          copy_file "awe-core.js", "public/javascripts/awe-core.js"
          copy_file "awe-state-machine.js", "public/javascripts/awe-state-machine.js"
        end
      end

    end
  end
end
