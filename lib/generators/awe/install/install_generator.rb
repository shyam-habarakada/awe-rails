require 'rails'

module Awe
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      desc "This generator installs AWE (Artefact Web Extensions) into rails"
      source_root File.expand_path('../../../../../vendor/assets/javascripts', __FILE__)
      javascripts_path = ::Rails.application.config.assets.enabled ? "vendor/assets/javascripts" : "public/javascripts"

      def copy_awe
        say_status("copying", "The AWE files", :green)
        copy_file "awe-core.js", "#{javascripts_path}/awe-core.js"
        copy_file "awe-state-machine.js", "#{javascripts_path}/awe-state-machine.js"
        copy_file "awe-ui.js", "#{javascripts_path}/awe-ui.js"
      end

    end
  end
end
