require 'karatekit/client'
require 'karatekit/default'

# Ruby toolkit for the GitHub API
module Karatekit

  class << self
    include Karatekit::Configurable

    # API client based on configured options {Configurable}
    #
    # @return [Karatekit::Client] API wrapper
    def client
      return @client if defined?(@client) && @client.same_options?(options)
      @client = Karatekit::Client.new(options)
    end

    private

    def respond_to_missing?(method_name, include_private=false)
      client.respond_to?(method_name, include_private) ||
      enterprise_admin_client.respond_to?(method_name, include_private) ||
      enterprise_management_console_client.respond_to?(method_name, include_private)
    end

    def method_missing(method_name, *args, &block)
      if client.respond_to?(method_name)
        return client.send(method_name, *args, &block)
      end

      super
    end

  end
end

Karatekit.setup
