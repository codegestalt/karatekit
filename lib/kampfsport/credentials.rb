module Kampfsport
  class OAuthCredentials
    def initialize(endpoint, access_token)
      @endpoint = endpoint
      @access_token = access_token
    end

    def set_authentication(request_options)
      request_options[:query] ||= {}
      request_options[:query]["access_token"] = @access_token
    end

    def access_token
      @access_token
    end

    def host
      @endpoint
    end
  end
end
