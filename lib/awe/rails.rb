module Awe
  module Rails
    PROTOTYPE_JS = %w{prototype effects dragdrop controls}

    if ::Rails.version < "3.1"
      require 'awe/rails/railtie'
    else
      require 'awe/rails/engine'
    end
    require 'awe/rails/version'
  end
end
