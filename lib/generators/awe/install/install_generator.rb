require 'rails'

module Awe
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      desc "This generator installs AWE (Artefact Web Extensions) into the rails asset pipeline"
      source_root File.expand_path('../../../../../vendor/assets/javascripts', __FILE__)

      def copy_awe
        say_status("copying", "awe-core", :green)
        copy_file "awe-core.js", "public/javascripts/awe-core.js"
        say_status("copying", "awe-state-machine", :green)
        copy_file "awe-state-machine.js", "public/javascripts/awe-state-machine.js"
      end

    end
  end
end

