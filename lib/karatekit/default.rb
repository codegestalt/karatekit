# require 'karatekit/middleware/follow_redirects'
require 'karatekit/response/raise_error'
# require 'karatekit/response/feed_parser'
require 'karatekit/version'

module Karatekit

  # Default configuration options for {Client}
  module Default

    # Default API endpoint
    API_ENDPOINT = "https://api.kampfsport.center".freeze

    # Default User Agent header string
    USER_AGENT   = "Karatekit Ruby Gem #{Karatekit::VERSION}".freeze

    # Default media type
    MEDIA_TYPE   = "application/json".freeze

    # In Faraday 0.9, Faraday::Builder was renamed to Faraday::RackBuilder
    RACK_BUILDER_CLASS = defined?(Faraday::RackBuilder) ? Faraday::RackBuilder : Faraday::Builder

    # Default Faraday middleware stack
    MIDDLEWARE = RACK_BUILDER_CLASS.new do |builder|
      builder.use Faraday::Request::Retry, exceptions: [Karatekit::ServerError]
      # builder.use Karatekit::Middleware::FollowRedirects
      builder.use Karatekit::Response::RaiseError
      # builder.use Karatekit::Response::FeedParser
      builder.adapter Faraday.default_adapter
    end

    class << self

      # Configuration options
      # @return [Hash]
      def options
        Hash[Karatekit::Configurable.keys.map{|key| [key, send(key)]}]
      end

      # Default access token from ENV
      # @return [String]
      def access_token
        ENV['KARATEKIT_ACCESS_TOKEN']
      end

      # Default API endpoint from ENV or {API_ENDPOINT}
      # @return [String]
      def api_endpoint
        ENV['KARATEKIT_API_ENDPOINT'] || API_ENDPOINT
      end

      # Default pagination preference from ENV
      # @return [String]
      def auto_paginate
        ENV['KARATEKIT_AUTO_PAGINATE']
      end

      # Default options for Faraday::Connection
      # @return [Hash]
      def connection_options
        {
          :headers => {
            :accept => default_media_type,
            :user_agent => user_agent
          }
        }
      end

      # Default media type from {MEDIA_TYPE}
      # @return [String]
      def default_media_type
        MEDIA_TYPE
      end

      # Default middleware stack for Faraday::Connection
      # from {MIDDLEWARE}
      # @return [Faraday::RackBuilder or Faraday::Builder]
      def middleware
        MIDDLEWARE
      end

      # Default pagination page size from ENV
      # @return [Integer] Page size
      def per_page
        page_size = ENV['KARATEKIT_PER_PAGE']

        page_size.to_i if page_size
      end

      # Default User-Agent header string from ENV or {USER_AGENT}
      # @return [String]
      def user_agent
        ENV['KARATEKIT_USER_AGENT'] || USER_AGENT
      end
    end
  end
end
