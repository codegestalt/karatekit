module Karatekit
  class Client

    # Methods for the Events API
    #
    # @see https://...
    module Events

      # List events
      #
      # @return [Array<Sawyer::Resource>] An array of hashes representing events
      # @see https://...
      def events(options = {})
        paginate "events", options
      end

      # Get a single event
      #
      # @param id [Integer] ID of the event
      # @return [Sawyer::Resource] A single event
      # @see https://...
      def event(id, options = {})
        get "events/#{id}", options
      end
    end
  end
end
