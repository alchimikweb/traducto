module Traducto
  class Railtie < Rails::Railtie
    initializer "traducto" do |app|
      ActiveSupport.on_load(:action_view) { require 'traducto/helpers' }
    end
  end
end
