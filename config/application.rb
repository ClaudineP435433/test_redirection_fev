require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestRedirectionFev
  class Application < Rails::Application
    config.generators do |generate|
          generate.assets false
          generate.helper false
          generate.test_framework  :test_unit, fixture: false
        end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.middleware.insert(0, Rack::ReverseProxy) do
      reverse_proxy_options preserve_host: false
      if Rails.env.production? or Rails.env.staging?
        reverse_proxy_options force_ssl: true, replace_response_host: true
      end
      reverse_proxy /^\/blog(\/?.*)$/, 'http://redirection.mihivai-blog.com/'
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
