module Karatekit
  class Client

    # Methods for the Sessions API
    #
    # @see https://...
    module Sessions

      # List sessions
      #
      # @return [Array<Sawyer::Resource>] An array of hashes representing sessions
      # @see https://...
      def sessions(options = {})
        paginate "sessions", options
      end

      # Get a single session
      #
      # @param id [Integer] ID of the session
      # @return [Sawyer::Resource] A single session
      # @see https://...
      def session(id, options = {})
        get "sessions/#{id}", options
      end
    end
  end
end
