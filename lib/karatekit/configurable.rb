module Karatekit

  # Configuration options for {Client}, defaulting to values
  # in {Default}
  module Configurable
    # @!attribute [w] access_token
    #   @see https://developer.github.com/v3/oauth/
    #   @return [String] OAuth2 access token for authentication
    # @!attribute api_endpoint
    #   @return [String] Base URL for API requests. default: https://api.github.com/
    # @!attribute auto_paginate
    #   @return [Boolean] Auto fetch next page of results until rate limit reached
    # @!attribute connection_options
    #   @see https://github.com/lostisland/faraday
    #   @return [Hash] Configure connection options for Faraday
    # @!attribute middleware
    #   @see https://github.com/lostisland/faraday
    #   @return [Faraday::Builder or Faraday::RackBuilder] Configure middleware for Faraday
    # @!attribute per_page
    #   @return [String] Configure page size for paginated results. API default: 30
    # @!attribute user_agent
    #   @return [String] Configure User-Agent header for requests.

    attr_accessor :access_token, :auto_paginate,
                  :connection_options, :default_media_type,
                  :middleware,
                  :per_page, :user_agent
    attr_writer :api_endpoint

    class << self

      # List of configurable keys for {Karatekit::Client}
      # @return [Array] of option keys
      def keys
        @keys ||= [
          :access_token,
          :api_endpoint,
          :default_media_type,
          :auto_paginate,
          :connection_options,
          :middleware,
          :per_page,
          :user_agent,
        ]
      end
    end

    # Set configuration options using a block
    def configure
      yield self
    end

    # Reset configuration options to default values
    def reset!
      Karatekit::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", Karatekit::Default.options[key])
      end
      self
    end
    alias setup reset!

    # Compares client options to a Hash of requested options
    #
    # @param opts [Hash] Options to compare with current client options
    # @return [Boolean]
    def same_options?(opts)
      opts.hash == options.hash
    end

    def api_endpoint
      File.join(@api_endpoint, "")
    end

    private

    def options
      Hash[Karatekit::Configurable.keys.map{|key| [key, instance_variable_get(:"@#{key}")]}]
    end
  end
end
