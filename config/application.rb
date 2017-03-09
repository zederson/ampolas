require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ampolas
  class Application < Rails::Application

    config.eager_load_paths += %W(#{config.root}/lib)
    config.log_tags ||= []
    config.log_tags += [:uuid]

    config.i18n.default_locale = 'pt-BR'
    config.i18n.enforce_available_locales = true
    config.encoding = 'utf-8'
    config.time_zone = 'Brasilia'
    config.active_record.default_timezone = :local
    config.active_record.time_zone_aware_attributes = false

    config.generators do |generate|
      generate.test_framework :rspec
      generate.stylesheets false
      generate.javascript_engine false
      generate.view_specs false
      generate.helper false
      generate.factory_girl dir: 'spec/factories'
    end
  end
end
