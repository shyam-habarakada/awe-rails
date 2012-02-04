require 'rails'

if ::Rails.version < "3.1"
  module Awe
    module Generators
      class InstallGenerator < ::Rails::Generators::Base

        desc "This generator installs jQuery #{Awe::Rails::JQUERY_VERSION}, jQuery-ujs, and (optionally) jQuery UI #{Awe::Rails::JQUERY_UI_VERSION}"
        class_option :ui, :type => :boolean, :default => false, :desc => "Include jQueryUI"
        source_root File.expand_path('../../../../../vendor/assets/javascripts', __FILE__)

        def remove_prototype
          Rails::PROTOTYPE_JS.each do |name|
            remove_file "public/javascripts/#{name}.js"
          end
        end

        def copy_jquery
          say_status("copying", "jQuery (#{Awe::Rails::JQUERY_VERSION})", :green)
          copy_file "awe.js", "public/javascripts/awe.js"
          copy_file "awe.min.js", "public/javascripts/awe.min.js"
        end

        def copy_jquery_ui
          if options.ui?
            say_status("copying", "jQuery UI (#{Awe::Rails::JQUERY_UI_VERSION})", :green)
            copy_file "awe-ui.js", "public/javascripts/awe-ui.js"
            copy_file "awe-ui.min.js", "public/javascripts/awe-ui.min.js"
          end
        end

        def copy_ujs_driver
          say_status("copying", "jQuery UJS adapter (#{Awe::Rails::JQUERY_UJS_VERSION[0..5]})", :green)
          remove_file "public/javascripts/rails.js"
          copy_file "jquery_ujs.js", "public/javascripts/jquery_ujs.js"
        end

      end
    end
  end
else
  module Awe
    module Generators
      class InstallGenerator < ::Rails::Generators::Base
        desc "Just show instructions so people will know what to do when mistakenly using generator for Rails 3.1 apps"

        def do_nothing
          say_status("deprecated", "You are using Rails 3.1, so this generator is no longer needed. The necessary files are already in your asset pipeline.")
          say_status("", "Just add `//= require awe` and `//= require jquery_ujs` to your app/assets/javascripts/application.js")
          say_status("", "If you upgraded your app from Rails 3.0 and still have awe.js, rails.js, or jquery_ujs.js in your javascripts, be sure to remove them.")
          # ok, nothing
        end
      end
    end
  end
end