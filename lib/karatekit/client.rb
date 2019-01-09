require 'karatekit/connection'
require 'karatekit/warnable'
require 'karatekit/arguments'
require 'karatekit/configurable'
require 'karatekit/authentication'
require 'karatekit/rate_limit'

require 'karatekit/client/locations'
require 'karatekit/client/products'
require 'karatekit/client/sessions'
require 'karatekit/client/events'
require 'karatekit/client/event_details'
require 'karatekit/client/rate_limit'

module Karatekit

  # Client for the kampfsport.center API
  #
  # @see https://developer.kampfsport.center
  class Client

    include Karatekit::Authentication
    include Karatekit::Configurable
    include Karatekit::Connection
    include Karatekit::Warnable

    include Karatekit::Client::Locations
    include Karatekit::Client::Products
    include Karatekit::Client::Sessions
    include Karatekit::Client::Events
    include Karatekit::Client::EventDetails
    include Karatekit::Client::RateLimit

    # Header keys that can be passed in options hash to {#get},{#head}
    CONVENIENCE_HEADERS = Set.new([:accept, :content_type])

    def initialize(options = {})
      # Use options passed in, but fall back to module defaults
      Karatekit::Configurable.keys.each do |key|
        value = options.key?(key) ? options[key] : Karatekit.instance_variable_get(:"@#{key}")
        instance_variable_set(:"@#{key}", value)
      end
    end

    # Text representation of the client, masking tokens and passwords
    #
    # @return [String]
    def inspect
      inspected = super

      if @access_token
        inspected = inspected.gsub! @access_token, "#{'*'*36}#{@access_token[36..-1]}"
      end

      inspected
    end

    # Set OAuth access token for authentication
    #
    # @param value [String] 40 character kampfsport.center OAuth access token
    def access_token=(value)
      reset_agent
      @access_token = value
    end
  end
end
