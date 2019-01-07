module Kampfsport
  class OAuthCredentials
    def initialize(access_token)
      @access_token = access_token
    end

    def set_authentication(request_options)
      request_options[:query] ||= {}
      request_options[:query]["access_token"] = @access_token
    end

    def access_token
      @access_token
    end
  end
end
