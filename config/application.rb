require_relative 'boot'

require 'rails/all'


Bundler.require(*Rails.groups)

module Facebookcloneapp
  class Application < Rails::Application
    config.time_zone = 'GMT'
    config.active_record.default_timezone = :local
    I18n.available_locales = [:en, :fr]
    config.i18n.default_locale = :fr
    config.load_defaults 6.0


  end
end
