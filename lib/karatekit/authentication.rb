module Karatekit

  # Authentication methods for {Karatekit::Client}
  module Authentication

    # Indicates if the client was supplied an OAuth
    # access token
    #
    # @see https://developer.github.com/v3/#authentication
    # @return [Boolean]
    def token_authenticated?
      !!@access_token
    end
  end
end
