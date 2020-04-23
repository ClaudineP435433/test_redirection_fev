# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application

use Rack::ReverseProxy do
  # reverse_proxy_options preserve_host: false
  # if Rails.env.production? or Rails.env.staging?
  #   reverse_proxy_options force_ssl: true, preserve_host: true
  # end
  # reverse_proxy(/^\/blog(\/.*)$/,
  #             'http://blog.mihivai-blog.com$1')

    # reverse_proxy(/^\/blog(\/.*)$/,
    #           'http://blog.mihivai-blog.com$1',
    #             opts = { force_ssl: true, preserve_host: true })
    use Rack::ReverseProxy do
    reverse_proxy(/^\/blog(\/.*)$/, 'http://blog.mihivai-blog.com$1', opts = { preserve_host: true })
    end

end
