require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ampolas
  class Application < Rails::Application

    config.autoload_paths += %W(#{config.root}/lib )
    config.log_tags = [:uuid]
    config.encoding = 'utf-8'
    config.time_zone = 'Brasilia'
    # config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]

  end
end
