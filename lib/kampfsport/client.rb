module Kampfsport
  class Client
    DEFAULT_HOST = "https://api.kampfsport.center/v1"

    attr_reader :request, :credentials

    def initialize(access_token: ENV['KAMPFSPORT_ACCESS_TOKEN'])
      @credentials = if access_token
         OAuthCredentials.new(access_token)
      else
        fail 'You must provide an :access_token'
      end
    end
  end
end
