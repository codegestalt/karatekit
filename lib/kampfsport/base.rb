module Kampfsport
  class Base
    attr_reader :request, :credentials

    def initialize(endpoint: nil, access_token: nil)
      @credentials = if access_token && endpoint
         OAuthCredentials.new(endpoint, access_token)
      else
        fail 'You must provide an :endpoint and :access_token'
      end
    end
  end
end
