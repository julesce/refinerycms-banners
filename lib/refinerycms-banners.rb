require 'refinerycms-base'

module Refinery
  module Banners
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "banners"
          plugin.activity = {
            :class => Banner,
            :title => 'name'
          }
        end
      end
    end
  end
end
