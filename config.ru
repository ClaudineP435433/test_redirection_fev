# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application

use Rack::ReverseProxy do
  reverse_proxy_options preserve_host: false
  if Rails.env.production? or Rails.env.staging?
    reverse_proxy_options force_ssl: true, replace_response_host: true
  end
  reverse_proxy(/^\/blog(\/.*)$/,
              'http://blog.mihivai-blog.com$1'
end
