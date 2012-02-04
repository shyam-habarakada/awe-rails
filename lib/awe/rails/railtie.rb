# Configure Rails 3.0 to use public/javascripts/awe et al
module Awe
  module Rails

    class Railtie < ::Rails::Railtie
      config.before_configuration do
        require "awe/assert_select" if ::Rails.env.test?

        if ::Rails.root.join("public/javascripts/awe-ui.min.js").exist?
          jq_defaults = %w(awe awe-ui)
          jq_defaults.map!{|a| a + ".min" } if ::Rails.env.production?
        else
          jq_defaults = ::Rails.env.production? ? %w(awe.min) : %w(awe)
        end

        # Merge the jQuery scripts, remove the Prototype defaults and finally add 'jquery_ujs'
        # at the end, because load order is important
        config.action_view.javascript_expansions[:defaults] -= PROTOTYPE_JS + ['rails']
        config.action_view.javascript_expansions[:defaults] |= jq_defaults
        config.action_view.javascript_expansions[:defaults] << 'jquery_ujs'
      end
    end

  end
end
