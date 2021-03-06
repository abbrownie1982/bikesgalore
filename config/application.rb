require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

#config.cache_store = :redis_store, 'redis://localhost:8080/0/cache'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.

# config.cache_store = :redis_store, 'redis://localhost:6379/0/cache'
Bundler.require(*Rails.groups)

module Workspace
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.cache_store = :redis_store, 'redis://localhost:6379/0/cache'

  end
end

ActiveSupport.halt_callback_chains_on_return_false = false