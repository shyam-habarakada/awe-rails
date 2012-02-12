require 'rails'
require 'open-uri'

module Awe
  module Generators
    class UpdateGenerator < ::Rails::Generators::Base

      desc "This generator updates AWE (Artefact Web Extensions) to the latest"

      @@github = "https://raw.github.com/sambaker/awe-core/master"

      source_root Rails.root
      
      def download_and_copy_awe
        files = []
        javascripts_path = ::Rails.application.config.assets.enabled ? "vendor/assets/javascripts" : "public/javascripts"
        
        say_status("getting", "The AWE file list from #{@@github}/ ...", :green)
        open("#{@@github}/files") { |f|
          f.each_line { |line| files.push(line.strip) unless line.starts_with?("#") }
        }

        # fetch files
        files.each { |file| 
          say_status("fetching", "#{@@github}/#{file} into #{javascripts_path} ...", :green)
          get "#{@@github}/#{file}", "#{javascripts_path}/#{file}"
        }

      rescue OpenURI::HTTPError
        say_status("error", "error fetching files", :red)
      end

    end
  end
end
