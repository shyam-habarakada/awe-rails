require 'rails'

module Awe
  module Generators
    class UpdateGenerator < ::Rails::Generators::Base

      desc "This generator updates AWE (Artefact Web Extensions) to the latest"

      @@tmp_path = "tmp/vendor/assets/javascripts"
      @@github = "https://github.com/sambaker/awe-core/blob/master"

      source_root Rails.root
      
      def download_and_copy_awe
        say_status("fetching", "awe files from #{@@github}/ ...", :green)
        get "#{@@github}/awe-core.js", "#{@@tmp_path}/awe-core.js"
        get "#{@@github}/awe-state-machine.js", "#{@@tmp_path}/awe-state-machine.js"

        say_status("copying", "awe files", :green)
        if ::Rails.application.config.assets.enabled         
          copy_file "#{@@tmp_path}/awe-core.js", "vendor/assets/javascripts/awe-core.js"
          copy_file "#{@@tmp_path}/awe-state-machine.js", "vendor/assets/javascripts/awe-state-machine.js"
        else
          copy_file "tmp/vendor/javascripts/awe-core.js", "public/javascripts/awe-core.js"
          copy_file "tmp/vendor/javascripts/awe-state-machine.js", "public/javascripts/awe-state-machine.js"
        end
      rescue OpenURI::HTTPError
        say_status("error", "could not fetch awe files", :red)
      end

    end
  end
end
